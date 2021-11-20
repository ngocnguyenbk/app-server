import Swiper from 'swiper'
import 'swiper/swiper-bundle.min.css'

const initSwiper = (el) => {
  const swiper = new Swiper(el, {
    spaceBetween: 10,
    slidesPerView: 5,
    height: 25,
    direction: 'horizontal',
  })

  return swiper
}

export default initSwiper
