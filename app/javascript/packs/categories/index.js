import { forEach } from 'lodash'
import { Modal } from 'bootstrap'
import axios from 'axios'

function Categories() {
  const module = this

  const options = { keyboard: false }
  module.urlDelete = null
  module.modalDelete = new Modal(document.getElementById('delete-category-modal'), { options })
  module.btnDelete = document.getElementsByClassName('btn-delete-category')
  module.btnConfirmDelete = document.getElementById('btn-confirm-delete-category')

  module.showModalDelete = () => {
    forEach(module.btnDelete, (item) => {
      item.addEventListener('click', (e) => {
        e.preventDefault()
        module.urlDelete = e.target.dataset.url
        module.modalDelete.show()
      })
    })
  }

  module.deleteCategory = () => {
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
    module.deleteCategory()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const categories = new Categories()
  categories.init()
})
