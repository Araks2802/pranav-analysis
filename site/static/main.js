/* Progressive-enhancement JS. Site is fully readable without it. */
(function () {
  "use strict";

  // ---- Mobile nav toggle --------------------------------------------------
  var toggle = document.querySelector(".nav-toggle");
  var nav = document.getElementById("primary-nav");
  if (toggle && nav) {
    toggle.addEventListener("click", function () {
      var open = nav.classList.toggle("is-open");
      toggle.setAttribute("aria-expanded", String(open));
    });
    nav.addEventListener("click", function (e) {
      if (e.target.tagName === "A") {
        nav.classList.remove("is-open");
        toggle.setAttribute("aria-expanded", "false");
      }
    });
  }

  // ---- Category filter + search ------------------------------------------
  var grid = document.querySelector(".js-filter-grid");
  if (grid) {
    var cards = Array.prototype.slice.call(grid.querySelectorAll(".card"));
    var chips = Array.prototype.slice.call(document.querySelectorAll(".chip"));
    var search = document.getElementById("article-search");
    var noResults = document.querySelector(".no-results");
    var activeFilter = "all";

    function apply() {
      var q = (search && search.value || "").trim().toLowerCase();
      var shown = 0;
      cards.forEach(function (card) {
        var cat = card.getAttribute("data-category") || "";
        var title = card.getAttribute("data-title") || "";
        var tags = card.getAttribute("data-tags") || "";
        var matchCat = activeFilter === "all" || cat === activeFilter;
        var matchQ = !q || title.indexOf(q) !== -1 || tags.indexOf(q) !== -1 || cat.toLowerCase().indexOf(q) !== -1;
        var show = matchCat && matchQ;
        card.hidden = !show;
        if (show) shown++;
      });
      if (noResults) noResults.hidden = shown !== 0;
    }

    chips.forEach(function (chip) {
      chip.addEventListener("click", function () {
        chips.forEach(function (c) { c.classList.remove("is-active"); });
        chip.classList.add("is-active");
        activeFilter = chip.getAttribute("data-filter");
        apply();
      });
    });
    if (search) search.addEventListener("input", apply);
  }

  // ---- Lightweight interactive chase chart (no external lib) --------------
  // Draws India's verified chase checkpoints vs the target line on a canvas.
  var ic = document.getElementById("chase-canvas");
  if (ic && ic.getContext) {
    var data = [];
    try { data = JSON.parse(ic.getAttribute("data-points")); } catch (e) { data = []; }
    var target = parseFloat(ic.getAttribute("data-target")) || 199;
    drawChase(ic, data, target);
    window.addEventListener("resize", function () { drawChase(ic, data, target); });
  }

  function drawChase(canvas, pts, target) {
    if (!pts || !pts.length) return;
    var dpr = window.devicePixelRatio || 1;
    var cssW = canvas.clientWidth || 640;
    var cssH = 320;
    canvas.width = cssW * dpr; canvas.height = cssH * dpr;
    canvas.style.height = cssH + "px";
    var ctx = canvas.getContext("2d");
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
    ctx.clearRect(0, 0, cssW, cssH);

    var padL = 44, padR = 16, padT = 16, padB = 34;
    var w = cssW - padL - padR, h = cssH - padT - padB;
    var maxX = 20, maxY = 215;
    function X(o) { return padL + (o / maxX) * w; }
    function Y(r) { return padT + h - (r / maxY) * h; }

    // grid + y labels
    ctx.strokeStyle = "#22314f"; ctx.fillStyle = "#90a0bd";
    ctx.font = "11px 'JetBrains Mono', monospace"; ctx.lineWidth = 1;
    for (var r = 0; r <= 200; r += 50) {
      ctx.beginPath(); ctx.moveTo(padL, Y(r)); ctx.lineTo(cssW - padR, Y(r)); ctx.stroke();
      ctx.fillText(String(r), 10, Y(r) + 4);
    }
    for (var o = 0; o <= 20; o += 4) {
      ctx.fillText(String(o), X(o) - 4, cssH - 12);
    }

    // target line
    ctx.strokeStyle = "#ff5d5d"; ctx.setLineDash([6, 5]);
    ctx.beginPath(); ctx.moveTo(padL, Y(target)); ctx.lineTo(cssW - padR, Y(target)); ctx.stroke();
    ctx.setLineDash([]);
    ctx.fillStyle = "#ff5d5d"; ctx.fillText("Target " + target, padL + 6, Y(target) - 8);

    // required-rate reference (0 -> target over 20)
    ctx.strokeStyle = "#3b4a68"; ctx.setLineDash([3, 4]);
    ctx.beginPath(); ctx.moveTo(X(0), Y(0)); ctx.lineTo(X(20), Y(target)); ctx.stroke();
    ctx.setLineDash([]);

    // chase line
    ctx.strokeStyle = "#c6f432"; ctx.lineWidth = 3; ctx.lineJoin = "round";
    ctx.beginPath();
    pts.forEach(function (p, i) { var fx = X(p.over), fy = Y(p.runs); i ? ctx.lineTo(fx, fy) : ctx.moveTo(fx, fy); });
    ctx.stroke();

    // points + labels
    ctx.fillStyle = "#c6f432";
    pts.forEach(function (p) {
      ctx.beginPath(); ctx.arc(X(p.over), Y(p.runs), 4.5, 0, Math.PI * 2); ctx.fill();
    });
    ctx.fillStyle = "#e8edf6"; ctx.font = "12px 'Inter', sans-serif";
    pts.forEach(function (p) {
      if (p.label) ctx.fillText(p.label, X(p.over) + 8, Y(p.runs) - 8);
    });
  }
})();
