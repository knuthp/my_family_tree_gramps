

serve_zensical:
    uv run zensical serve

serve:
    uv run python -m http.server -d _build

build: build_gramps build_zensical
    cp -r site/* _build/

build_gramps:
    ./scripts/gramps_html
    ./scripts/gramps_fan_chart

build_zensical:
    uv run zensical build

clean:
    rm -rf _build site