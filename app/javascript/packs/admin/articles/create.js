import $ from 'jquery'
import axios from 'axios'
import 'select2'
import 'select2/dist/css/select2.css'
import 'select2-bootstrap-theme/dist/select2-bootstrap.min.css'
import '@ckeditor/ckeditor5-build-classic'
import { Modal } from 'bootstrap'

function Articles() {
  const module = this

  module.modalConfirm = new Modal(document.getElementById('article-modal'))
  module.btn = document.getElementById('save-button')
  module.btnConfirm = document.getElementById('btn-confirm-article')
  module.articleForm = document.getElementById('article-form')
  module.selectCategory = $('#article_category_id')
  module.selectSubCategory =  $('#article_sub_category_id')
  module.selectAuthor = $('#article_author_id')

  module.showModal = () => {
    module.btn.addEventListener('click', (e) => {
      e.preventDefault()
      module.modalConfirm.show()
    })
  }

  module.confirm = () => {
    module.btnConfirm.addEventListener('click', (e) => {
      module.articleForm.submit()
    })
  }

  module.initSelect2 = () => {
    module.selectCategory.select2({
      placeholder: 'Chọn thể loại',
      theme: 'bootstrap',
    })

    module.selectSubCategory.select2({
      placeholder: 'Chọn danh mục',
      theme: 'bootstrap',
      language: {
        noResults() {
          return "Vui lòng chọn thể loại"
        }
      }
    })

    module.selectAuthor.select2({
      placeholder: 'Chọn tác giả',
      theme: 'bootstrap',
    })
  }

  module.initCKeditor = () => {
    ClassicEditor.create(document.querySelector('.editor'))
  }

  module.setCategory = () => {
    module.selectCategory.on('select2:select', (e) => {
      const categoryId = e.params.data.id
      module.getSubCategory(categoryId)
    })
  }

  module.getSubCategory = async (categoryId) => {
    const { data } = await axios.get(`/api/sub_categories?category_id=${categoryId}`)
    const subCategories = data.map(subCategory => {
      return {
        id: subCategory.id,
        text: subCategory.name
      }
    })
    module.selectSubCategory.empty()
    module.selectSubCategory.select2({
      placeholder: 'Chọn danh mục',
      theme: 'bootstrap',
      data: subCategories,
    })
  }

  module.init = () => {
    module.showModal()
    module.confirm()
    module.initSelect2()
    module.setCategory()
    module.initCKeditor()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const articles = new Articles()
  articles.init()
})
