import $ from 'jquery'
import { Modal } from 'bootstrap'
import '@libs/select2'

function Topics() {
  const module = this
  const options = { keyboard: false }

  module.modalConfirm = new Modal(document.getElementById('topic-modal'), { options })
  module.btn = document.getElementById('save-button')
  module.btnConfirm = document.getElementById('btn-confirm-topic')
  module.topicForm = document.getElementById('topic-form')
  module.selectCategory = $('#topic_category_id')

  module.initSelect2 = () => {
    module.selectCategory.select2({
      allowClear: true,
      placeholder: 'Chọn thể loại',
      theme: 'bootstrap',
    })
  }

  module.showModal = () => {
    module.btn.addEventListener('click', (e) => {
      e.preventDefault()
      module.modalConfirm.show()
    })
  }

  module.confirm = () => {
    module.btnConfirm.addEventListener('click', () => {
      module.topicForm.submit()
    })
  }

  module.init = () => {
    module.initSelect2()
    module.showModal()
    module.confirm()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const topics = new Topics()
  topics.init()
})
