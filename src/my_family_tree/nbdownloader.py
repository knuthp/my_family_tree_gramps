import re
from pathlib import Path
import requests
import typer
from rich.console import Console
import urllib.request

app = typer.Typer()
console = Console()


@app.command("download")
def download_newspaper(url: str, page: int, resolution: int = 4096, dest=None):
    """Downloads newspaper page."""
    meta = _get_item_info_from_url(url)
    urn = meta["metadata"]["identifiers"]["urn"]

    url = f"https://www.nb.no/services/image/resolver/{urn}-1_{page:03d}_null/full/{resolution},/0/default.jpg"
    if dest is None:
        newspaper = meta["metadata"]["title"].strip().lower().replace(" ", "_")
        date = meta["metadata"]["originInfo"]["issued"]
        dest = Path.cwd() / f"{newspaper}_{date}_page_{page}.jpg"
    _download(url, dest)
    console.print(f"Downloaded {dest.relative_to(Path.cwd())}")


def _download(url: str, dest: Path):
    urllib.request.urlretrieve(url, dest)


@app.command("meta")
def meta(url: str):
    """Maps from viewable newspaper to metadata"""
    meta = _get_item_info_from_url(url)
    console.print(meta)


def _get_item_info_from_url(url):
    uuid = _url_to_uuid(url)
    headers = {"Accept": "application/json"}
    resp = requests.get(f"https://api.nb.no/catalog/v1/items/{uuid}", headers=headers)
    if not resp.ok:
        console.print(f"[red]Failed to rerieve item info ({uuid})")
        raise typer.Exit(code=2)
    meta = resp.json()
    return meta


def _url_to_uuid(url: str) -> str:
    # Regex pattern to capture UUID
    uuid_pattern = re.compile(r"[0-9a-fA-F]{32}")
    match = uuid_pattern.search(url)

    if match is None:
        console.print("[red]No UUID found in the URL")
        raise typer.Exit(code=1)

    return match.group(0)
