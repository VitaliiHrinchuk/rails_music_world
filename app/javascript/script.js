document.addEventListener('turbolinks:load', function () {
  let elems = document.querySelectorAll('.sidenav');
  let instances = M.Sidenav.init(elems);
  let carousels = document.querySelectorAll('.carousel');
  let carouselInstance = M.Carousel.init(carousels, {
    dist: -100,
    numVisible: 2,
    indicators: true,
    fullWidth: true,
  });
  M.CharacterCounter.init(document.querySelectorAll('.has-character-counter'));
  M.FormSelect.init(document.querySelectorAll('select'));
});
