function doReloadWithCache() {
  window.location.reload(false);
}
window.addEventListener('load', function () {
  setTimeout(doReloadWithCache, 5000);
});



