import { forEach } from 'lodash'
import { Modal } from 'bootstrap'
import axios from 'axios'

function SubCategories() {
  const module = this

  const options = { keyboard: false }
  module.urlDelete = null
  module.modalDelete = new Modal(document.getElementById('delete-sub-category-modal'), { options })
  module.btnDelete = document.getElementsByClassName('btn-delete-sub-category')
  module.btnConfirmDelete = document.getElementById('btn-confirm-delete-sub-category')

  module.showModalDelete = () => {
    forEach(module.btnDelete, (item) => {
      item.addEventListener('click', (e) => {
        e.preventDefault()
        module.urlDelete = e.target.dataset.url
        module.modalDelete.show()
      })
    })
  }

  module.deleteSubCategory = () => {
    module.btnConfirmDelete.addEventListener('click', async () => {
      const response = await axios.delete(module.urlDelete)
      const { status } = response

      if (status === 200) {
        window.location.reload()
      }
    })
  }

  module.init = () => {
    module.showModalDelete()
    module.deleteSubCategory()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const subCategories = new SubCategories()
  subCategories.init()
})
