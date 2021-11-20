function BackToTop() {
  const module = this
  module.btnBackToTop = document.getElementById('back-to-top')

  const scrollFunction = () => {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      module.btnBackToTop.style.display = 'block'
    } else {
      module.btnBackToTop.style.display = 'none'
    }
  }

  const backToTop = () => {
    document.body.scrollTop = 0
    document.documentElement.scrollTop = 0
  }

  module.init = () => {
    module.btnBackToTop.addEventListener('click', backToTop)
    window.onscroll = () => {
      scrollFunction()
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const backToTop = new BackToTop()
  backToTop.init()
})
