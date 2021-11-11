import { Modal } from 'bootstrap'

function SubCategories() {
  const module = this

  const options = { keyboard: false }
  module.url = null
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

  module.init = () => {
    module.showModal()
    module.confirm()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const subCategories = new SubCategories()
  subCategories.init()
})
