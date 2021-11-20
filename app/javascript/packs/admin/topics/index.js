import { forEach } from 'lodash'
import { Modal } from 'bootstrap'
import axios from 'axios'

function Topics() {
  const module = this

  const options = { keyboard: false }
  module.urlDelete = null
  module.modalDelete = new Modal(document.getElementById('delete-topic-modal'), { options })
  module.btnDelete = document.getElementsByClassName('btn-delete-topic')
  module.btnConfirmDelete = document.getElementById('btn-confirm-delete-topic')

  module.showModalDelete = () => {
    forEach(module.btnDelete, (item) => {
      item.addEventListener('click', (e) => {
        e.preventDefault()
        module.urlDelete = e.target.dataset.url
        module.modalDelete.show()
      })
    })
  }

  module.deleteTopic = () => {
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
    module.deleteTopic()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const topics = new Topics()
  topics.init()
})
