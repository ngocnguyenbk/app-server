import { Modal } from 'bootstrap'
// import pickr from '../../../libs/pickr'

function Categories() {
  const module = this
  const options = { keyboard: false }

  const pickrColor = new Pickr({
    el: '.color-picker',
    theme: 'nano',
    swatches: [
      'rgba(244, 67, 54, 1)',
      'rgba(233, 30, 99, 0.95)',
      'rgba(156, 39, 176, 0.9)',
      'rgba(103, 58, 183, 0.85)',
      'rgba(63, 81, 181, 0.8)',
      'rgba(33, 150, 243, 0.75)',
      'rgba(3, 169, 244, 0.7)',
      'rgba(0, 188, 212, 0.7)',
      'rgba(0, 150, 136, 0.75)',
      'rgba(76, 175, 80, 0.8)',
      'rgba(139, 195, 74, 0.85)',
      'rgba(205, 220, 57, 0.9)',
      'rgba(255, 235, 59, 0.95)',
      'rgba(255, 193, 7, 1)'
    ],
    components: {
      preview: true,
      opacity: true,
      hue: true,
      interaction: {
        hex: true,
        rgba: true,
        input: true,
        clear: true,
        save: true
      }
    }
  })

  module.hexCode = document.getElementById('category_hex_code')
  module.url = null
  module.modalConfirm = new Modal(document.getElementById('category-modal'), { options })
  module.btn = document.getElementById('save-button')
  module.btnConfirm = document.getElementById('btn-confirm-category')
  module.categoryForm = document.getElementById('category-form')

  module.showModal = () => {
    module.btn.addEventListener('click', (e) => {
      e.preventDefault()
      module.url = e.target.dataset.url
      module.modalConfirm.show()
    })
  }

  module.confirm = () => {
    module.btnConfirm.addEventListener('click', (e) => {
      module.categoryForm.submit()
    })
  }

  pickrColor.on('save', (color, instance) => {
    module.hexCode.value = color.toHEXA().toString()
    console.log('Event: "save"', color.toHEXA().toString(), instance);
  })

  module.init = () => {
    module.showModal()
    module.confirm()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const categories = new Categories()
  categories.init()
})
