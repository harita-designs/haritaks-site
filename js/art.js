/* Art pages: Framer-style masonry. Images keep their order and are dealt into columns
   left to right (1st image to column 1, 2nd to column 2, ...), like the live site.
   data-cols="desktop,tablet,mobile" sets the column count per breakpoint. */
(() => {
  const grids = document.querySelectorAll('.art-grid');
  if (!grids.length) return;
  const mqDesk = matchMedia('(min-width: 1200px)');
  const mqTab = matchMedia('(min-width: 810px)');

  grids.forEach((grid) => {
    const items = [...grid.querySelectorAll(':scope > img')];
    const counts = grid.dataset.cols.split(',').map(Number);
    let current = 0;

    const layout = () => {
      const n = mqDesk.matches ? counts[0] : mqTab.matches ? counts[1] : counts[2];
      if (n === current) return;
      current = n;
      const cols = Array.from({ length: n }, () => {
        const c = document.createElement('div');
        c.className = 'art-col';
        return c;
      });
      items.forEach((img, i) => cols[i % n].appendChild(img));
      grid.replaceChildren(...cols);
      grid.classList.add('is-ready');
    };

    layout();
    mqDesk.addEventListener('change', layout);
    mqTab.addEventListener('change', layout);
  });
})();
