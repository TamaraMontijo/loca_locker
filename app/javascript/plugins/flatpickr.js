import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
require("flatpickr/dist/themes/material_green.css");

flatpickr(".datepicker", {
    enableTime: true,
    minTime: "01:00",
    altInput: true
})

flatpickr(".timepicker", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    time_24hr: true
})


