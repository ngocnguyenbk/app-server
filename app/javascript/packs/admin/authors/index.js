import { forEach } from 'lodash'
import { Modal } from 'bootstrap'
import axios from 'axios'

function Authors() {
  const module = this

  const options = { keyboard: false }
  module.urlDelete = null
  module.modalDelete = new Modal(document.getElementById('delete-author-modal'), { options })
  module.btnDelete = document.getElementsByClassName('btn-delete-author')
  module.btnConfirmDelete = document.getElementById('btn-confirm-delete-author')

  module.showModalDelete = () => {
    forEach(module.btnDelete, (item) => {
      item.addEventListener('click', (e) => {
        e.preventDefault()
        module.urlDelete = e.target.dataset.url
        module.modalDelete.show()
      })
    })
  }

  module.deleteAuthor = () => {
    module.btnConfirmDelete.addEventListener('click', async (e) => {
      const response = await axios.delete(module.urlDelete)
      const { status } = response

      if (status === 200) {
        window.location.reload()
      }
    })
  }

  module.init = () => {
    module.showModalDelete()
    module.deleteAuthor()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const authors = new Authors()
  authors.init()
})
