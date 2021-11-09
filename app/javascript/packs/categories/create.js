import { Modal } from 'bootstrap'

function Categories() {
  const module = this

  const options = { keyboard: false }
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

  module.init = () => {
    module.showModal()
    module.confirm()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const categories = new Categories()
  categories.init()
})
