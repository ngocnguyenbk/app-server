import "../../stylesheets/pages/_categories.scss"

function Categories() {
  const module = this
  const titleCalendar = document.getElementById("title-calendar")
  const picker = new Litepicker({
    element: document.getElementById('js-litepicker'),
    singleMode: false,
  })

  module.setPicker = () => {
    picker.on('selected', (starDate, endDate) => {
      const start = starDate.format('DD/MM')
      const end = endDate.format('DD/MM')
      titleCalendar.innerHTML = `${start} - ${end}`
      titleCalendar.style.color = 'cornflowerblue'
    })
  }

  module.init = () => {
    module.setPicker()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const categories = new Categories()
  categories.init()
})
