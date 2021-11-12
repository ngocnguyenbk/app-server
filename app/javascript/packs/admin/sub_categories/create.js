import { Modal } from 'bootstrap'
import { initPickr } from '@libs/pickr'

function SubCategories() {
  const module = this
  const options = { keyboard: false }

  module.url = null
  module.inputHexCode = document.getElementById('sub_category_hex_code')
  module.modalConfirm = new Modal(document.getElementById('sub-category-modal'), { options })
  module.btn = document.getElementById('save-button')
  module.btnConfirm = document.getElementById('btn-confirm-sub-category')
  module.subCategoryForm = document.getElementById('sub-category-form')

  module.showModal = () => {
    module.btn.addEventListener('click', (e) => {
      e.preventDefault()
      module.url = e.target.dataset.url
      module.modalConfirm.show()
    })
  }

  module.confirm = () => {
    module.btnConfirm.addEventListener('click', (e) => {
      module.subCategoryForm.submit()
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
  const subCategories = new SubCategories()
  subCategories.init()
})
