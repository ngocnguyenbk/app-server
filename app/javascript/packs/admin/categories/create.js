import { Modal } from 'bootstrap'
import { initPickr } from '@libs/pickr'

function Categories() {
  const module = this
  const options = { keyboard: false }

  module.url = null
  module.inputHexCode = document.getElementById('category_hex_code')
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

  module.initPickr = () => {
    const color = module.inputHexCode.value || '#000'
    module.pickrColor = initPickr(color)
  }

  module.chooseColor = () => {
    module.pickrColor.on('save', (color) => {
      module.inputHexCode.value = color.toHEXA().toString()
      module.pickrColor.hide()
    })
  }

  module.init = () => {
    module.showModal()
    module.confirm()
    module.initPickr()
    module.chooseColor()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const categories = new Categories()
  categories.init()
})
