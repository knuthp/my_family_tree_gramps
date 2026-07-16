# Technical Exploration

<script src="https://d3js.org/d3.v7.min.js"></script>

## Family Tree

Is it possible to use D3.js or similar to render a family tree?

<div id="tree"></div>

<style>
  #tree {
    width: 100%;
    height: 600px;
    overflow-x: auto;
  }

  .node circle {
    fill: #4c8bf5;
  }

  .node text {
    font: 14px sans-serif;
    fill: #333;
  }

  .link {
    fill: none;
    stroke: #aaa;
    stroke-width: 2px;
  }
</style>

<script id="tree-data" type="application/json">
{
  "name": "You",
  "born": "1980",
  "parents": [
    {
      "name": "Father",
      "born": "1950",
      "died": "2010",
      "parents": [
        { "name": "Paternal Grandfather", "born": "1920", "died": "1995" },
        { "name": "Paternal Grandmother", "born": "1925", "died": "2001" }
      ]
    },
    {
      "name": "Mother",
      "born": "1955",
      "parents": [
        {
          "name": "Maternal Grandfather",
          "born": "1918",
          "died": "1988",
          "parents" : [
            {
              "name": "Great Grandfather",
              "born": "1890",
              "died": "1955",
              "parents": [
                { "name": "Great-Great Grandmother", "born": "1860", "died": "1900" }
              ]
              },
            { "name": "Great Grandmother", "born": "1890", "died": "1930" }
          ]
          },
        { "name": "Maternal Grandmother", "born": "1922", "died": "1999" }
      ]
    }
  ]
}
</script>


<script>
document.addEventListener("DOMContentLoaded", () => {
  const data = JSON.parse(
    document.getElementById("tree-data").textContent
  );

  const width = 1000;
  const height = 600;

  const svg = d3
    .select("#tree")
    .append("svg")
    .attr("viewBox", [0, 0, width, height]);

  const g = svg.append("g").attr("transform", "translate(40,40)");

  const treeLayout = d3.tree().size([height - 80, width - 160]);

  // 👇 parents instead of children
  const root = d3.hierarchy(data, d => d.parents);
  treeLayout(root);

  // Links
  g.selectAll(".link")
    .data(root.links())
    .enter()
    .append("path")
    .attr("class", "link")
    .attr(
      "d",
      d3.linkHorizontal()
        .x(d => d.y)
        .y(d => d.x)
    );

  // Nodes
  const node = g
    .selectAll(".node")
    .data(root.descendants())
    .enter()
    .append("g")
    .attr("class", "node")
    .attr("transform", d => `translate(${d.y},${d.x})`);

  node.append("circle")
    .attr("r", 6)
    .attr("fill", d => d.data.died ? "#999" : "#4c8bf5");

  // Name
  node.append("text")
    .attr("x", 10)
    .attr("dy", "-0.3em")
    .style("font-weight", "bold")
    .text(d => d.data.name);

  // Dates
  node.append("text")
    .attr("x", 10)
    .attr("dy", "1.0em")
    .style("font-size", "12px")
    .style("fill", "#555")
    .text(d => {
      const b = d.data.born ? `b. ${d.data.born}` : "";
      const dth = d.data.died ? ` – d. ${d.data.died}` : "";
      return b + dth;
    });
});
</script>