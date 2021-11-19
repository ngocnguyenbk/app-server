import '@/stylesheets/pages/_categories.scss'
import Litepicker from 'litepicker'
import initSwiper from '@/libs/swiper'

function Categories() {
  const module = this
  const titleCalendar = document.getElementById('title-calendar')
  const picker = new Litepicker({
    element: document.getElementById('js-litepicker'),
    singleMode: false,
  })
  initSwiper('.swiper')

  module.setPicker = () => {
    picker.on('selected', (starDate, endDate) => {
      const start = starDate.format('DD/MM')
      const end = endDate.format('DD/MM')
      titleCalendar.innerHTML = `${start} - ${end}`
      titleCalendar.style.color = 'cornflowerblue'
    })
  }

  module.setHeightBoxNews = () => {
    const topStory = document.getElementsByClassName('section-category__topstory')[0]
    const boxNews = document.getElementsByClassName('box-news')[0]
    boxNews.style.height = `${topStory.offsetHeight}px`
  }

  module.init = () => {
    module.setPicker()
    module.setHeightBoxNews()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const categories = new Categories()
  categories.init()
})
