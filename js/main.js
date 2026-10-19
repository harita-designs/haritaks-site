// haritaks.com - interactions (no libraries)
const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

// 1. Nav letter roll: split each link into letters (Framer does the same)
document.querySelectorAll('[data-roll]').forEach((link) => {
  const text = link.textContent.trim();
  link.setAttribute('aria-label', text);
  link.innerHTML = '<span class="roll" aria-hidden="true">' +
    [...text].map((ch, i) => `<span style="--i:${i}" data-l="${ch}">${ch}</span>`).join('') +
    '</span>';
});

// 2. Mobile menu
const toggle = document.querySelector('.nav-toggle');
const links = document.querySelector('.nav-links');
const setMenu = (open) => {
  toggle.setAttribute('aria-expanded', String(open));
  toggle.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
  links.classList.toggle('is-open', open);
};
toggle.addEventListener('click', () => setMenu(toggle.getAttribute('aria-expanded') !== 'true'));
links.addEventListener('click', (e) => { if (e.target.closest('a')) setMenu(false); });

// 3. Custom cursor: pink dot that follows the pointer
const cursor = document.querySelector('.cursor');
if (window.matchMedia('(hover: hover)').matches) {
  window.addEventListener('pointermove', (e) => {
    cursor.style.transform = `translate(${e.clientX}px, ${e.clientY}px)`;
    cursor.classList.add('is-on');
  }, { passive: true });
  document.addEventListener('pointerleave', () => cursor.classList.remove('is-on'));
}

// 4. "Beyond the Interface" scroll scene
//    Measured on Framer: progress runs from the moment the section's top enters
//    the bottom of the screen until the sticky part releases.
//    - Cards slide right to left across the whole range (start at 1.6x screen width).
//    - Cards 1 and 3 drift down 200u, card 2 drifts up 200u (parallax wave).
//    - Background image scrolls at 70% of page speed (parallax).
const beyond = document.querySelector('.beyond');
if (beyond) {
  const bg = beyond.querySelector('.beyond-bg');
  const cards = [...beyond.querySelectorAll('.art-card')];
  let metrics = {};

  // Read the CSS scale unit (--u) in pixels by measuring a probe 1000u wide
  const probe = document.createElement('div');
  probe.style.cssText = 'position:absolute;visibility:hidden;width:calc(1000 * var(--u));height:0';
  document.body.appendChild(probe);
  const unit = () => probe.getBoundingClientRect().width / 1000;

  function measure() {
    const cs = getComputedStyle(beyond);
    const u = unit();
    const cardW = parseFloat(cs.getPropertyValue('--card-w')) * u;
    const cardH = parseFloat(cs.getPropertyValue('--card-h')) * u;
    const gap = parseFloat(cs.getPropertyValue('--card-gap')) * u;
    const vw = window.innerWidth, vh = window.innerHeight;
    const pageX = beyond.getBoundingClientRect().left;
    // Framer: first card starts 2306px in at 1440 and moves 0.3px further per extra px of width
    const start = vw >= 1200 ? 2266 * u + (vw - 1440) * 0.3 : vw * 1.6 - pageX;
    const lastStart = start + (cards.length - 1) * (cardW + gap);
    const travel = lastStart + cardW + vw * 0.368;       // 5100px at 1440 (measured on the live site)
    metrics = { cardW, cardH, gap, vh, start, travel, u };
  }

  function update() {
    const rect = beyond.getBoundingClientRect();
    const { cardW, cardH, gap, vh, start, travel, u } = metrics;
    const range = beyond.offsetHeight;                   // enter-bottom -> sticky release
    const scrolled = vh - rect.top;
    const p = reduceMotion ? 0.35 : Math.min(1, Math.max(0, scrolled / range));

    const centerY = (vh - (cards[0] ? cards[0].offsetHeight : cardH)) / 2;
    cards.forEach((card, i) => {
      const x = start + i * (cardW + gap) - p * travel;
      const wave = (i % 2 === 0 ? -100 + 200 * p : 100 - 200 * p) * u;
      card.style.setProperty('--x', `${x}px`);
      card.style.setProperty('--y', `${centerY + wave}px`);
    });

    // background: Framer moves it 0.3x page scroll from the very top of the page (not only once the section is on screen)
    bg.style.setProperty('--bg-y', `${vh * 0.771 + 0.3 * scrolled}px`);
  }

  let ticking = false;
  const onScroll = () => {
    if (ticking) return;
    ticking = true;
    requestAnimationFrame(() => { update(); ticking = false; });
  };
  measure(); update();
  window.addEventListener('scroll', onScroll, { passive: true });
  window.addEventListener('resize', () => { measure(); update(); });
}

// 4b. Hero portrait parallax (Framer, desktop + tablet): the photo moves down at 0.6x the scroll inside its clipped frame
const portrait = document.querySelector('.hero-portrait img');
if (portrait && !reduceMotion) {
  const mq = window.matchMedia('(min-width: 810px)');
  let queued = false;
  const move = () => {
    queued = false;
    const y = mq.matches ? window.scrollY * 0.6 : 0;
    portrait.style.setProperty('--py', `${y}px`);
  };
  window.addEventListener('scroll', () => { if (!queued) { queued = true; requestAnimationFrame(move); } }, { passive: true });
  mq.addEventListener('change', move);
  move();
}

// 5. Case study videos (Framer behavior): paused at 50% with a play button; click to play at full opacity.
//    Videos also pause when scrolled off screen so only one plays at a time.
document.querySelectorAll('.cs-player').forEach((player) => {
  const video = player.querySelector('video');
  const btn = player.querySelector('.cs-play');
  btn.addEventListener('click', () => video.play());
  video.addEventListener('play', () => {
    player.classList.add('is-playing');
    document.querySelectorAll('.cs-player video').forEach((v) => { if (v !== video) v.pause(); });
  });
  video.addEventListener('pause', () => player.classList.remove('is-playing'));
  new IntersectionObserver(([entry]) => { if (!entry.isIntersecting) video.pause(); }, { threshold: 0 }).observe(video);
});

// 6. Autoplay videos (VTech): muted loops that play only while on screen (Framer behavior).
//    With reduced motion they stay on their poster frame.
const autoVideos = document.querySelectorAll('video.cs-auto');
if (autoVideos.length) {
  const io = new IntersectionObserver((entries) => {
    entries.forEach(({ target, isIntersecting }) => {
      if (isIntersecting && !reduceMotion) {
        if (target.preload === 'none') target.preload = 'auto';
        target.play().catch(() => {});
      } else {
        target.pause();
      }
    });
  }, { rootMargin: '200px 0px', threshold: 0 });
  autoVideos.forEach((v) => io.observe(v));
}

// 7. Case study section menu (VTech): pink toggle opens numbered jump links
const sectionMenu = document.querySelector('.vt-menu');
if (sectionMenu) {
  const btn = sectionMenu.querySelector('.vt-menu-toggle');
  const setOpen = (open) => {
    sectionMenu.classList.toggle('is-open', open);
    btn.setAttribute('aria-expanded', String(open));
    btn.setAttribute('aria-label', open ? 'Close section menu' : 'Open section menu');
  };
  btn.addEventListener('click', () => setOpen(btn.getAttribute('aria-expanded') !== 'true'));
  sectionMenu.addEventListener('click', (e) => { if (e.target.closest('a')) setOpen(false); });
  document.addEventListener('keydown', (e) => { if (e.key === 'Escape') setOpen(false); });
  document.addEventListener('click', (e) => { if (!sectionMenu.contains(e.target)) setOpen(false); });
}

// 8. Cursor "CLICK" state over gallery images (Framer cursor variant on the Visual design page)
if (cursor && window.matchMedia('(hover: hover)').matches) {
  document.querySelectorAll('[data-cursor="click"]').forEach((el) => {
    el.addEventListener('pointerenter', () => cursor.classList.add('is-click'));
    el.addEventListener('pointerleave', () => cursor.classList.remove('is-click'));
  });
}
