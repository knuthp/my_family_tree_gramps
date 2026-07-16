# Fredrikstad

Fredrikstad er en by i vekst på 1800 tallet. Både Knut og Gunhild har slekt som lever der samtidig.

## Slektstre Knut slekt

Knut's tipp-oldefar Peder Pedersen flytter dit i 1835 og finner sin kone der. Og oldefar Kristian Pedersen bor der i hele sitt liv og farfar Asbjørn
Pedersen vokser opp der.

## Traramoen

![Traramoen](img/traramoen_google_maps.png)

### Traraveien 39

[Google Street View](https://maps.app.goo.gl/SXDsb1rejLnHFM6M7)


 Mina Anette Pedersen sin død nevner Traraveien 39



## Slektstre Gunhild slekt

Gunhild's tipp-tipp-oldefar Christen Dahl flytter til Fredrikstad med sin kone Randi og tipp-oldefar Oluf Petter Dahl vokser opp der frem til han dør bare 33 år gammel. Hans kone Emilie Hansine Alette Dahl bor der, men flytter og ender opp på Høvik. Emilie Hansine Alette Dahl sine foreldre Hans Mathisen og Marie Mathisen er født og bor hele sitt liv i Vaterland.


<div id="dahl-family-tree" class="d3-family-tree">
  <div class="d3ft-toolbar">
    <button type="button" data-action="zoom-in" aria-label="Zoom in">+</button>
    <button type="button" data-action="zoom-out" aria-label="Zoom out">−</button>
    <button type="button" data-action="reset" aria-label="Reset view">Reset</button>
    <span class="d3ft-hint">Drag to pan · scroll/pinch to zoom</span>
  </div>
  <div class="d3ft-canvas">
    <svg id="dahl-family-tree-svg"></svg>
  </div>
</div>

<style>
  .d3-family-tree {
    --d3ft-male-border: #4b6ea8;
    --d3ft-male-bg: #eef3fb;
    --d3ft-female-border: #b4577a;
    --d3ft-female-bg: #fbeef3;
    --d3ft-line: #8a8f98;
    --d3ft-text: #23262b;
    --d3ft-muted: #6b7078;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    border: 1px solid #d8dbe0;
    border-radius: 10px;
    overflow: hidden;
    background: #fcfcfd;
    margin: 1.5em 0;
  }
  .d3ft-toolbar {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 8px 12px;
    border-bottom: 1px solid #e2e4e8;
    background: #f5f6f8;
  }
  .d3ft-toolbar button {
    width: 28px;
    height: 28px;
    line-height: 1;
    border-radius: 6px;
    border: 1px solid #cfd3d9;
    background: #fff;
    cursor: pointer;
    font-size: 15px;
    color: var(--d3ft-text);
  }
  .d3ft-toolbar button:hover { background: #eef0f3; }
  .d3ft-toolbar button[data-action="reset"] { width: auto; padding: 0 10px; font-size: 12px; }
  .d3ft-hint {
    margin-left: auto;
    font-size: 11px;
    color: var(--d3ft-muted);
  }
  .d3ft-canvas {
    width: 100%;
    height: 640px;
    cursor: grab;
  }
  .d3ft-canvas:active { cursor: grabbing; }
  #dahl-family-tree-svg { width: 100%; height: 100%; display: block; }

  .d3ft-node rect {
    stroke-width: 1.6;
    rx: 8;
    ry: 8;
    filter: drop-shadow(0 1px 1px rgba(0,0,0,0.06));
  }
  .d3ft-node.male rect { fill: var(--d3ft-male-bg); stroke: var(--d3ft-male-border); }
  .d3ft-node.female rect { fill: var(--d3ft-female-bg); stroke: var(--d3ft-female-border); }
  .d3ft-node .name { font-size: 13px; font-weight: 600; fill: var(--d3ft-text); }
  .d3ft-node .meta { font-size: 10.5px; fill: var(--d3ft-muted); font-style: italic; }
  .d3ft-node .years { font-size: 10.5px; fill: var(--d3ft-text); font-weight: 500; }

  .d3ft-marriage {
    stroke: var(--d3ft-line);
    stroke-width: 1.5;
    fill: none;
  }
  .d3ft-descent {
    stroke: var(--d3ft-line);
    stroke-width: 1.5;
    fill: none;
  }
  .d3ft-legend text { font-size: 11px; fill: var(--d3ft-muted); }
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/7.9.0/d3.min.js"></script>
<script>
(function () {
  // ---- Data -------------------------------------------------------------
  const W = 210, H = 108; // box size

  const people = [
    // Generation 0
    { id: 1,  x: 200,  y: 40,   sex: "M", name: "Nils Thomesen",           occ: "Arbejdsmand",              place: "? – ?",                          years: "? – ?" },
    { id: 2,  x: 440,  y: 40,   sex: "F", name: "Helge Rasmusdatter",      occ: "–",                        place: "? – ?",                          years: "1754 – ?" },
    { id: 3,  x: 820,  y: 40,   sex: "M", name: "Michel Kjøstolsen",       occ: "Arbejdsmand",              place: "? – ?",                          years: "1753 – ?" },
    { id: 4,  x: 1060, y: 40,   sex: "F", name: "Berthe Jonsdtr.",         occ: "–",                        place: "? – ?",                          years: "1758 – ?" },
    { id: 5,  x: 1340, y: 40,   sex: "M", name: "Nils Bøckmann",           occ: "Snekkermester",            place: "Sverige",                        years: "1740 – ?" },
    { id: 6,  x: 1680, y: 40,   sex: "F", name: "Guri Larsdatter",         occ: "–",                        place: "Skjeberg?",                      years: "? – ?" },

    // Generation 1
    { id: 7,  x: 520,  y: 340,  sex: "M", name: "Mathis Nilsen",           occ: "Matros",                   place: "Fredrikstad – ?",                years: "1794 – ?" },
    { id: 8,  x: 940,  y: 340,  sex: "F", name: "Anne Cathrine Michelsdtr", occ: "–",                       place: "Fredrikstad",                    years: "1793 – ?" },
    { id: 9,  x: 1460, y: 340,  sex: "M", name: "Niels Nilsen Bøckmann",   occ: "Snekkermester",            place: "Fredrikstad – Fredrikstad",      years: "1791 – 1871" },
    { id: 10, x: 1800, y: 340,  sex: "F", name: "Hedvig Larsdatter",       occ: "–",                        place: "? – ?",                          years: "? – 1883" },

    // Generation 2
    { id: 11, x: 140,  y: 640,  sex: "M", name: "Christen Pedersen Dahl",  occ: "Bagermester",              place: "Rommedal – Fredrikstad",         years: "1821 – 1900" },
    { id: 12, x: 380,  y: 640,  sex: "F", name: "Randi Dahl",              occ: "–",                        place: "Kongsvinger – Fredrikstad",      years: "1824 – ?" },
    { id: 13, x: 980,  y: 640,  sex: "M", name: "Hans Mathisen",           occ: "Los",                      place: "Fredrikstad – Fredrikstad",      years: "1828 – 1907" },
    { id: 14, x: 1424, y: 640,  sex: "F", name: "Alette Marie Mathisen",   occ: "–",                        place: "Fredrikstad – ?",                years: "1840 – ?" },

    // Generation 3
    { id: 15, x: 260,  y: 940,  sex: "M", name: "Oluf Petter Dahl",        occ: "Bager",                    place: "Hamar – Fredrikstad",            years: "1855 – 1888" },
    { id: 16, x: 1400, y: 940,  sex: "F", name: "Emilie Hansine Alette Dahl", occ: "Jordmor",               place: "Fredrikstad – Bærum",            years: "1860 – 1945" },

    // Generation 4
    { id: 17, x: 830,  y: 1240, sex: "M", name: "Hans Oluf Petter Dahl",   occ: "Assistent Geogr. oppmåling", place: "Fredrikstad – Bærum",           years: "1888 – 1978" },
    { id: 18, x: 1070, y: 1240, sex: "F", name: "Margit Nathalie Dahl",    occ: "–",                        place: "Oslo – Bærum",                   years: "1891 – 1974" },

    // Generation 5
    { id: 19, x: 950,  y: 1540, sex: "M", name: "Gunnar Oluf Dahl",        occ: "–",                        place: "Bærum – Bærum",                  years: "1917 – 2010" },
  ];

  const marriages = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18]];
  const descents  = [
    { parents: [1,2],   child: 7  },
    { parents: [3,4],   child: 8  },
    { parents: [5,6],   child: 9  },
    { parents: [7,8],   child: 13 },
    { parents: [9,10],  child: 14 },
    { parents: [11,12], child: 15 },
    { parents: [13,14], child: 16 },
    { parents: [15,16], child: 17 },
    { parents: [17,18], child: 19 },
  ];

  const byId = new Map(people.map(p => [p.id, p]));
  const cx = p => p.x + W / 2;
  const cy = p => p.y + H / 2;

  // ---- Layout bounds ------------------------------------------------------
  const margin = 60;
  const maxX = d3.max(people, p => p.x + W) + margin;
  const maxY = d3.max(people, p => p.y + H) + margin;
  const minX = -margin;
  const minY = -margin;

  const svg = d3.select("#dahl-family-tree-svg")
    .attr("viewBox", [minX, minY, maxX - minX, maxY - minY].join(" "));

  const root = svg.append("g").attr("class", "d3ft-root");

  // ---- Connectors: marriages ----------------------------------------------
  const marriageG = root.append("g").attr("class", "d3ft-marriages");
  marriages.forEach(([a, b]) => {
    const pa = byId.get(a), pb = byId.get(b);
    const y = cy(pa);
    const x1 = Math.min(pa.x + W, pb.x + W);
    const x2 = Math.max(pa.x, pb.x);
    const left = pa.x < pb.x ? pa : pb;
    const right = pa.x < pb.x ? pb : pa;
    marriageG.append("path")
      .attr("class", "d3ft-marriage")
      .attr("d", `M${left.x + W},${cy(left)} L${right.x},${cy(right)}`);
  });

  // ---- Connectors: descent (elbow) ----------------------------------------
  const descentG = root.append("g").attr("class", "d3ft-descents");
  descents.forEach(d => {
    const pa = byId.get(d.parents[0]);
    const pb = byId.get(d.parents[1]);
    const child = byId.get(d.child);
    const midX = (cx(pa) + cx(pb)) / 2;
    const startY = pa.y + H; // bottom of parent row
    const endY = child.y;    // top of child box
    const busY = startY + (endY - startY) / 2;
    const childX = cx(child);
    const path = `M${midX},${startY} V${busY} H${childX} V${endY}`;
    descentG.append("path").attr("class", "d3ft-descent").attr("d", path);
  });

  // ---- Text wrapping helper -------------------------------------------------
  function wrapText(text, maxWidth, fontSize) {
    // rough char-width estimate for the given font size
    const avgChar = fontSize * 0.56;
    const maxChars = Math.floor(maxWidth / avgChar);
    if (text.length <= maxChars) return [text];
    const words = text.split(" ");
    const lines = [];
    let cur = "";
    words.forEach(w => {
      const test = cur ? cur + " " + w : w;
      if (test.length > maxChars && cur) {
        lines.push(cur);
        cur = w;
      } else {
        cur = test;
      }
    });
    if (cur) lines.push(cur);
    return lines.slice(0, 2); // cap at 2 lines
  }

  // ---- Nodes ---------------------------------------------------------------
  const nodeG = root.append("g").attr("class", "d3ft-nodes");
  const node = nodeG.selectAll("g.d3ft-node")
    .data(people)
    .join("g")
    .attr("class", p => `d3ft-node ${p.sex === "M" ? "male" : "female"}`)
    .attr("transform", p => `translate(${p.x},${p.y})`);

  node.append("rect")
    .attr("width", W)
    .attr("height", H);

  const pad = 10;

  node.each(function (p) {
    const g = d3.select(this);
    let yCursor = 20;

    const nameLines = wrapText(p.name, W - pad * 2, 13);
    nameLines.forEach(line => {
      g.append("text")
        .attr("class", "name")
        .attr("x", pad)
        .attr("y", yCursor)
        .text(line);
      yCursor += 15;
    });

    yCursor += 3;
    const occLines = wrapText(p.occ, W - pad * 2, 10.5);
    occLines.forEach(line => {
      g.append("text")
        .attr("class", "meta")
        .attr("x", pad)
        .attr("y", yCursor)
        .text(line);
      yCursor += 12;
    });

    const placeLines = wrapText(p.place, W - pad * 2, 10.5);
    placeLines.forEach(line => {
      g.append("text")
        .attr("class", "meta")
        .attr("x", pad)
        .attr("y", yCursor)
        .text(line);
      yCursor += 12;
    });

    g.append("text")
      .attr("class", "years")
      .attr("x", pad)
      .attr("y", H - 10)
      .text(p.years);
  });

  // ---- Legend ---------------------------------------------------------------
  const legend = root.append("g")
    .attr("class", "d3ft-legend")
    .attr("transform", `translate(${minX + margin - 40}, ${minY + margin - 40})`);

  // ---- Zoom / pan -------------------------------------------------------------
  const zoom = d3.zoom()
    .scaleExtent([0.25, 3])
    .on("zoom", (event) => root.attr("transform", event.transform));

  svg.call(zoom);

  // Initial fit: scale so full width fits the visible canvas on load
  function fitToView() {
    const canvas = document.querySelector("#dahl-family-tree .d3ft-canvas");
    const cw = canvas.clientWidth;
    const ch = canvas.clientHeight;
    const fullW = maxX - minX;
    const fullH = maxY - minY;
    const scale = Math.min(cw / fullW, ch / fullH) * 0.95;
    const tx = (cw - fullW * scale) / 2 - minX * scale;
    const ty = (ch - fullH * scale) / 2 - minY * scale;
    svg.call(zoom.transform, d3.zoomIdentity.translate(tx, ty).scale(scale));
  }

  window.addEventListener("resize", fitToView);
  setTimeout(fitToView, 0);

  // ---- Toolbar controls ---------------------------------------------------
  const wrapEl = document.getElementById("dahl-family-tree");
  wrapEl.querySelector('[data-action="zoom-in"]').addEventListener("click", () => svg.transition().duration(200).call(zoom.scaleBy, 1.3));
  wrapEl.querySelector('[data-action="zoom-out"]').addEventListener("click", () => svg.transition().duration(200).call(zoom.scaleBy, 1 / 1.3));
  wrapEl.querySelector('[data-action="reset"]').addEventListener("click", fitToView);
})();
</script>

```
                        Nils Thomesen   Helge Rasmusdatter  Michel Kjøstolsen    Berthe Jonsdtr.    Nils Bøckmann----------------Guri Larsdatter
                        Arbejdsmand     -                   Arbejdsmand          -                  Snekkermester                -
                        ? - ?           ? - ?               ? - ?                ? - ?              Sverige                      Skjeberg?
                        ? - ?           1754 - ?            1753 - ?             1758 - ?           1740 - ?                     ? - ?
                          |---------------|---|                 |--------|-----------|                  |
                                              |                          |                              |
                                          Mathis Nilsen         Anne Cathrine Michelsdtr            Niels Nilsen Bøckmann--------Hedvig Larsdatter
                                          Matros                -                                   Snekkermester                -
                                          Fredrikstad - ?       Fredrikstad                         Fredrikstad - Fredrikstad    ? - ?
                                          1794 - ?              1793 - ?                            1791 - 1871                  ? - 1883
                                               |------------------------|                               |
                                                                        |                               |
            Christen Pedersen Dahl -------Randi Dahl            Hans Mathisen-----------------------Alette Marie Mathisen
            Bagermester                   -                     Los                                 -
            Rommedal - Fredrikstad        Kongsvinger - Fredri  Fredrikstad - Fredrikstad           Fredrikstad -
            1821 - 1900                   1824 - ?              1828 - 1907                         1840 - ?
                |                                                       |
                |                                                       |
            Oluf Petter Dahl------------------------------------Emilie Hansine Alette Dahl
            Bager                                               Jordmor
            Hamar - Fredrikstad                                 Fredrikstad - Bærum
            1855 - 1888                                         1860 - 1945
                |
                |
            Hans Oluf Petter Dahl---------Margit Nathalie Dahl
            Assistent Geogr. oppmåling    -
            Fredrikstad - Bærum           Oslo - Bærum
            1888 - 1978                   1891 - 1974
                |
                |
            Gunnar Oluf Dahl
            Bærum - Bærum
            1917 - 2010

```

1. Hans Mathisen var gift med Alette Marie Mathisen, før dette var han gift med Alette sin søster Emilie som var 9 år eldre.
2. Oluf Petter Dahl dør før sønne Hans Oluf Petter Dahl blir født.
3. Anna Catarine Michelsdtr sin far er oppgitt som "Udlagt til barnefader" som betyr at mor har navngitt denne personen som barnefar. De bor sammen i 1801, så trolig er de et par, men ikke gift. Bosted ved barnets fødsel er også spennende "Hos borgemæsteren".




### Folketellinger/Fødsler etc

1. 1801 Uden for byen - Bostedsnr 8. No. 273 (Michel Kiøstelosen og Berthe Joensdatter med barnet Anne Cathrine Michelsdatter) Totalt 4 personer  [Folktellingen 1801](https://www.digitalarkivet.no/gf01058191001803)
1. 1801 Vaterland - Gårdens nummer 246 (Bosted 0026) (Nils Thomesen og Helge Rasmusdatter med barnet Mathis Nilsen og 1 annet barn) Total 5 personer. [Folktellingen 1801](https://www.digitalarkivet.no/gf01058191001701)
1. 1828 Vaterland - Myhra Hans Mathisen fødes der.
1. 1865 Vaterland - Bødkergata 19: Gårdens nummer 249 - (Bosted 323 i folketellingen) (Hans og Alette Marie Mathisen med barnet Hansine Alette og 3 andre barn) Totalt 12 personer i gården [Folktellingen 1865](https://www.digitalarkivet.no/gf01037981004725)
1. 1865 Byen - Gårdens nummer 107 (Christen og Randi Dahl med barnet Oluf og 2 andre barn) Totalt 17 personer i gården. [Folketellingen 1865](https://www.digitalarkivet.no/gf01037981001480
1. 1870 Byen - Færgeports Gade 127-131 (Christen og Randi Dahl med barnet Oluf Petter) [Folktellingen 1870](https://www.digitalarkivet.no/gf01053318000122)
1. 1870 Vaterland - Bødkergata 19: Gårdens nummer 249 (Hans Mathisen med Emilie og 3 andre barn) Totalt 9 personer i gården. [Folktellingen 1870](https://www.digitalarkivet.no/pf01053318001795)
1. 1875 Vaterland - Bødkergata 19: Gårdens nummer 19 Hans Mathisen bor der med datteren Emilie samt 2 andre barn. Totalt 10 personer. (Gårdens eier er Peter Christensen Dahl) [Folktellingen 1875](https://www.digitalarkivet.no/gf01052006001854)
1. 1875 Byen - Færgeportgade: Gårdens nummer 80 (Christen og Randi Dahl med barnet Oluf Petter samt 2 andre barn) (Gårdens eier er Smed C. Larsen) [Folktellingen 1875](https://www.digitalarkivet.no/gf01052006001450)
1. 1885 Byen - Voldgade: Gårdens nummer 10 (Christen og Randi Dahl med Oluf) Totalt 15 personer i gården (Gårdens eier er Fattigforstander Jensen) [Folketellingen 1885](https://www.digitalarkivet.no/gf01053251009180)
1. 1891 Byen - Bostedsnr 58 (Emilie Dahl med barnet Hans og 2 andre barn samt Emilies far Hans Mathisen) Totalt 33 personer. [Folktellingen 1891](https://www.digitalarkivet.no/bf01052671000295)
1. 1891 Byen - Bostedsnr 73 (Christen og Randi Dahl) Totalt 14 personer. [Folketellingen 1891](https://www.digitalarkivet.no/bf01052671000295)
1. 1900 Byen - Kasernegade: Gårdens nummer 52 (Christen og Randi Dahl) 4 leiligheter på 1 etasje, Total 13 personer.   [Folkeltellingen 1900](https://www.digitalarkivet.no/gf01036995001116)
1. 1910 Byen - Voldgate 4 (Randi Dahl som Hospitalslem) 2 Leiligheter på 2 etasjer, Totalt 18 personer  [Folktellinge 1910](https://www.digitalarkivet.no/gf01036335000053)


## Vaterland

Navnet Vaterland kommer trolig fra tysk Vaderlant/Vaterland og ble bruk som en betegnelse på et "fristed" utenfor byens jurisdiksjon og skatter.

> Vaterland er en del av Fredrikstad by som ligger rett sør for Gamlebyen. Den er preget lav trehusbebyggelse fra 17- og 1800-tallet. Vaterland består idag av bebyggelsen som ligger til gatene Lodsgaten, Skippergaten, Bødtkergaten og Movigsgate. Vaterland oppsto opprinnelig som en forstad til byen innenfor vollene. Navnet stammer trolig fra nederlandsk og hentyder på et flatt, lavtliggende sumpland.
>
> Vaterlands Historie
> Vaterland opptrer i kildene først i 1666, men det kan allerede ha vært bebyggelse her før det. Etter bybrannen i 1653 flyttet trolig en del av byens fattige hit, og etter at det permanente festningsanlegget ble påbegynt i 1660-årene, er det sannsynlig at flere har flyttet ut av byen. Trehusbebyggelsen utenfor festningsvollene bød på bekymring, og i 1682 fikk stattholder Ulrik Frederik Gyldenløve gjennom at det kun skulle settes opp trehus i Vaterland hvis eierne på forhånd hadde bygget murhus innenfor vollene. Det skulle vise seg vanskelig å gjennomføre og det ble gitt tillatelse til enkelte sjøfolk å bygge i Vaterland.
>
>Gjentatte bybranner og påbud om murtvang i byen førte til at flere slo seg ned i Vaterland, igjen i konflikt med de militære myndighetene i byen. Under Den store nordiske krig i 1712 var det frykt for et svensk angrep, og kommandant Peter Jacob Wilster beordret bebyggelsen i Vaterland skutt i brann for å sikre festningens forterreng.
[Wikipedia](https://lokalhistoriewiki.no/Vaterland_(Fredrikstad))

1. [Wikipedia](https://lokalhistoriewiki.no/Vaterland_(Fredrikstad))
2. [Miljøbevaring i Vaterland. Utg. Bevaringskomitéen for Vaterland. Fredrikstad. 1981.](https://www.nb.no/items/e7dc6fa8735a8c7ae23d1046f2a86648?page=0&searchText=Miljøbevaring i Vaterland)


### Oversiktskart Gamlebyen og Vaterland

![Vaterland Map Big](img/vaterland_google_maps_sattelite_big.png)

### Oversiktskart Vaterland

![Vaterland Map Details](img/vaterland_google_maps_sattelite_details.png)

### Myhra

i Pladsen Myhra paa Byens Grund

1. 1819 Mathis Nilsen, Anne Cathrine Mikelsdatter (barn født Maren Helene)
1. 1828 Mathis Nilsen, Anne Cathrine Mikelsdatter (Hans Mathisen blir født)



### Movigsgate 27

* Tidligere matrikkel nr. 246
* Tomteareal: 174.29 m2

![Movigsgate 27 fasade](img/vaterland_movigsgate_27.png)

Eies i

* 1797 Niels Thomesen

[Miljøbevaring i Vaterland : en forstad til festningsbyen Fredrikstad](https://www.nb.no/items/e7dc6fa8735a8c7ae23d1046f2a86648??page=165) side 162

### Bødkergaten 19

* Tidligere matrikkel nr. 249.
* Tomteareal 184.5 m2

[Google Streetview](https://maps.app.goo.gl/ELzeo8DrCKdgYq7i8)

![Bødkergaten 19](img/vaterland_boedkergaten_19.png)


Eies i

* 1817 Niels Thomesen
* 1827 Niels Thomesen enke


[Miljøbevaring i Vaterland : en forstad til festningsbyen Fredrikstad](https://www.nb.no/items/e7dc6fa8735a8c7ae23d1046f2a86648?page=133) side 131

### Skippergaten 3

* Tidligere matrikkel nr 240B.

[Google Streetview](https://maps.app.goo.gl/8cVzzteYi2kvAA6E9)


![Skippergaten 3 Fasade](img/vaterland_skippergaten_3.png)

Relaterte personer

* 1805 Niels Bøckmann og Guri Larsdatter med barnet Niels Nielsen Bøckmann
* 1817 Guri Larsdatter

Eies i

* 1805 Niels Bøckmann,
* 1817 Guri Larsdatter, enke etter Niels Bøckmann
* 1844 Nils Bøckmann (Trolig barn som ikke er direkte i slektsrekken)


Guri Larsdatter lånte i 1806 50 riksdaler av kjøpmann Peter Bull mot pant i hennes eiendom matrikkelnr 240 i Vaterland. Beløpet ble anvendt til å betale gjeld som hennes avdøde mann Niels Bøckmann, hadde pådratt seg og for at "de forekomme at huset og løsøret ikke skulde blive solgte eller utlagte".

Protokoll fra taksasjonsforretning på eiendommen:

> Anton Wilhelm Scheel, byfogd og ene magistrat i Friderichstad i Norge, gjør vitterlig: At år 1807 den 9. januar ble en taksasjonsforretning avholdt over gården nr. 240 i byens forstad Vaterland beliggende. Forretningen fremmet av byfogden med de utnevnte edsvorne laugrettes- og taksasjonsmenn S. Lassen, Holth, Sollie og J. Møller etter forlangende av enken Guri Larsdatter, enke etter Niels Bøckmann som tilkjennega at behøve denne forretning i betryggelse mot panthaveren. Taksasjonsmennene befat at gården besto av et vånhus av tømmer en etasje, hvori en stue og kjøkken med 2 fag vinduer i stuen, en 1-etasjes ovn. I gården et fehus og et vedskjul av tømmer og bord, samt dertil en liten hage.
>
> Denne gård som beskreven med tomt, ble anført verd 90 rd., sier nitti riksdalder og er samme i Brannkassen forsikret for 50 rd. Mot den satta takst hadde forretningsføreren intet at innvende.


[Miljøbevaring i Vaterland : en forstad til festningsbyen Fredrikstad](https://www.nb.no/items/e7dc6fa8735a8c7ae23d1046f2a86648?page=83) side 81

## Fredrikstad Gamlebyen

### Oversiktskart Gamlebyen

![Fredrikstad Gamlebyen Map Details](img/fredrikstad_gamlebyen_google_maps_sattelite_details.png)

### Færgeportsgate 127 - 131

Relaterte personer

* 1870 Christen og Randi Dahl med barnet Oluf Petter
* 1875 Christen og Randi Dahl med barnet Oluf Petter og 2 andre barn

### Kasernegade

Gårdens nummer 52

Relaterte personer

* 1900 Christen og Randi Dahl

### Voldgade

Relaterte personer

* 1885 Christen og Randi Dahl med barnet Oluf Petter

### Voldgade 4

Relaterte personer

* 1910 Randi Dahl som Hospitalslem