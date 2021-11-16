import { forEach } from 'lodash'
import { Modal } from 'bootstrap'
import $ from 'jquery'
import axios from 'axios'
import Litepicker from 'litepicker'

import resetForm from '@/libs/reset-form'
import '@libs/select2'

function Articles() {
  const module = this

  module.modalPublish = new Modal(document.getElementById('publish-article-modal'))
  module.btnPublish = document.getElementsByClassName('btn-publish-article')
  module.btnConfirmPublish = document.getElementById('btn-confirm-publish-article')
  module.publishGteq = document.getElementById('q_published_at_gteq')
  module.publishLteq = document.getElementById('q_published_at_lteq')
  module.selectSubCategory = $('#q_sub_category_id_eq')
  module.btnReset = document.getElementById('btn-reset-articles')

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

  module.initSelect2 = () => {
    module.selectSubCategory.select2({
      allowClear: true,
      placeholder: 'Chọn danh mục',
      theme: 'bootstrap',
    })
  }

  module.initPicker = () => {
    module.picker = new Litepicker({
      element: document.getElementById('q_published_at'),
      singleMode: false,
      lang: 'vi',
      format: 'DD/MM/YYYY',
    })

    if (!!module.publishGteq.value && !!module.publishLteq.value) {
      const start = new Date(module.publishGteq.value)
      const end = new Date(module.publishLteq.value)
      module.picker.setDateRange(start, end)
    }
  }

  module.setPicker = () => {
    module.picker.on('selected', (starDate, endDate) => {
      module.publishGteq.value = starDate.format('DD/MM/YYYY')
      module.publishLteq.value = endDate.format('DD/MM/YYYY')
    })
  }

  module.btnReset.onclick = () => {
    const form = document.getElementById('article_search')
    /* eslint-disable no-restricted-globals */
    history.pushState(null, null, '/admin/articles')
    module.selectSubCategory.val(null).trigger('change')
    resetForm(form)
  }

  module.init = () => {
    module.showModalPublish()
    module.publishArticle()
    module.initSelect2()
    module.initPicker()
    module.setPicker()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const article = new Articles()
  article.init()
})
