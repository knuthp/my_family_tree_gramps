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
  "name": "John Smith",
  "children": [
    {
      "name": "Anna Smith",
      "children": [
        { "name": "Peter Smith" },
        { "name": "Laura Smith" }
      ]
    },
    {
      "name": "Michael Smith",
      "children": [
        { "name": "Sophie Smith" }
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

  const width = 900;
  const height = 600;

  const svg = d3
    .select("#tree")
    .append("svg")
    .attr("viewBox", [0, 0, width, height]);

  const g = svg.append("g").attr("transform", "translate(80,40)");

  const treeLayout = d3.tree().size([height - 80, width - 160]);

  const root = d3.hierarchy(data);
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

  node.append("circle").attr("r", 6);

  node
    .append("text")
    .attr("dy", 3)
    .attr("x", d => (d.children ? -10 : 10))
    .style("text-anchor", d => (d.children ? "end" : "start"))
    .text(d => d.data.name);
});
</script>