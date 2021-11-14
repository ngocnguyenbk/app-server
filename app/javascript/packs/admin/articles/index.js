import { forEach } from 'lodash'
import { Modal } from 'bootstrap'
import axios from 'axios'

function Articles() {
  const module = this

  module.modalPublish = new Modal(document.getElementById('publish-article-modal'))
  module.btnPublish = document.getElementsByClassName('btn-publish-article')
  module.btnConfirmPublish = document.getElementById('btn-confirm-publish-article')

  module.showModalPublish = () => {
    forEach(module.btnPublish, (item) => {
      item.addEventListener('click', (e) => {
        e.preventDefault()
        module.urlPublish = e.target.dataset.url
        module.modalPublish.show()
      })
    })
  }

  module.publishArticle = () => {
    module.btnConfirmPublish.addEventListener('click', async () => {
      const response = await axios.patch(module.urlPublish)
      const { status } = response

      if (status === 200) {
        window.location.reload()
      }
    })
  }

  module.init = () => {
    module.showModalPublish()
    module.publishArticle()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const article = new Articles()
  article.init()
})
