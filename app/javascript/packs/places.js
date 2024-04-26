document.addEventListener('turbolinks:load', () => {
  function initAutocomplete() {
    const input = document.getElementById('address-input');
    if (!input) return;  // inputがない場合は初期化しない
    const autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.setFields(['address_components', 'geometry', 'formatted_address']);

    autocomplete.addListener('place_changed', function() {
      const place = autocomplete.getPlace();
      if (!place.geometry) {
        window.alert("No details available for input: '" + input.value + "'");
        return;
      }
    });
  }

  window.initAutocomplete = initAutocomplete;
});