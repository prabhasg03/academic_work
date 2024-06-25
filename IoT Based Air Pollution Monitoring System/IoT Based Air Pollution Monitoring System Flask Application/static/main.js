// Fetch current data and update present.html
function fetchCurrentData() {
    axios.get('/current_data')
        .then(response => {
            const data = response.data;
            document.getElementById('current-time').textContent = `Current Time: ${data.timestamp}`;
            document.getElementById('current-location').textContent = `Location: Hyderabad`;  // Replace with your actual location
            document.getElementById('current-aqi').textContent = `AQI: ${data.air_quality}`;
            document.getElementById('current-temperature').textContent = `Temperature: ${data.temperature} °C`;
            document.getElementById('current-humidity').textContent = `Humidity: ${data.humidity} %`;
        })
        .catch(error => console.error('Error fetching current data:', error));
}

// Trigger fetchCurrentData() when present.html is loaded
window.onload = function() {
    if (document.getElementById('current-time')) {
        fetchCurrentData();
    }
};
