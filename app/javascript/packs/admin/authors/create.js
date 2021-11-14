import { Modal } from 'bootstrap'

function Authors() {
  const module = this
  const options = { keyboard: false }

  module.modalConfirm = new Modal(document.getElementById('author-modal'), { options })
  module.btn = document.getElementById('save-button')
  module.btnConfirm = document.getElementById('btn-confirm-author')
  module.authorForm = document.getElementById('author-form')

  module.showModal = () => {
    module.btn.addEventListener('click', (e) => {
      e.preventDefault()
      module.modalConfirm.show()
    })
  }

  module.confirm = () => {
    module.btnConfirm.addEventListener('click', () => {
      module.authorForm.submit()
    })
  }

  module.init = () => {
    module.showModal()
    module.confirm()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const authors = new Authors()
  authors.init()
})
