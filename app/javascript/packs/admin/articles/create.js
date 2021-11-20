import $ from 'jquery'
import axios from 'axios'
import { Modal } from 'bootstrap'
import { forEach } from 'lodash'
import '@ckeditor/ckeditor5-build-classic'
import '@/stylesheets/pages/admin/_articles.scss'

import '@libs/select2'
import '@libs/bootstrap-fileinput'

function Articles() {
  const module = this

  module.modalConfirm = new Modal(document.getElementById('article-modal'))
  module.btn = document.getElementById('save-button')
  module.btnConfirm = document.getElementById('btn-confirm-article')
  module.articleForm = document.getElementById('article-form')
  module.selectCategory = $('#article_category_id')
  module.selectSubCategory = $('#article_sub_category_id')
  module.selectTopic = $('#article_topic_id')
  module.selectAuthor = $('#article_author_id')
  module.thumbnails = document.getElementById('article_thumbnails')
  module.thumbnail = document.getElementById('thumbnails')
  module.iconDeleteThumb = document.getElementsByClassName('icon-delete-thumb')

  module.showModal = () => {
    module.btn.addEventListener('click', (e) => {
      e.preventDefault()
      module.modalConfirm.show()
    })
  }

  module.confirm = () => {
    module.btnConfirm.addEventListener('click', () => {
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
          return 'Vui lòng chọn thể loại'
        },
      },
    })

    module.selectTopic.select2({
      allowClear: true,
      placeholder: 'Chọn chủ đề',
      theme: 'bootstrap',
      language: {
        noResults() {
          return 'Vui lòng chọn thể loại'
        },
      },
    })

    module.selectAuthor.select2({
      placeholder: 'Chọn tác giả',
      theme: 'bootstrap',
    })
  }

  module.initCKeditor = () => {
    /* eslint-disable no-undef */
    ClassicEditor.create(document.querySelector('.editor'))
  }

  module.initFileInput = () => {
    $('#article_thumbnails').fileinput({
      showBrowse: false,
      browseOnZoneClick: true,
      showRemove: false,
      showUpload: false,
      dropZoneTitle: 'Kéo thả files vào đây',
      dropZoneClickTitle: '',
      msgPlaceholder: 'Chọn files',
      msgSelected: '{n} files được chọn',
      showDrag: true,
    })
  }

  const getSubCategory = async (categoryId) => {
    const { data } = await axios.get(`/api/sub_categories?category_id=${categoryId}`)
    const subCategories = data.map((subCategory) => ({
      id: subCategory.id,
      text: subCategory.name,
    }))
    module.selectSubCategory.empty()
    module.selectSubCategory.select2({
      placeholder: 'Chọn danh mục',
      theme: 'bootstrap',
      data: subCategories,
    })
  }

  const getTopic = async (categoryId) => {
    const { data } = await axios.get(`/api/topics?category_id=${categoryId}`)
    const topics = data.map((topic) => ({
      id: topic.id,
      text: topic.name,
    }))
    module.selectTopic.empty()
    module.selectTopic.select2({
      allowClear: true,
      placeholder: 'Chọn danh mục',
      theme: 'bootstrap',
      data: topics,
    })
  }

  module.setCategory = () => {
    module.selectCategory.on('select2:select', (e) => {
      const categoryId = e.params.data.id
      getSubCategory(categoryId)
      getTopic(categoryId)
    })
  }

  module.deleteThumbnail = () => {
    forEach(module.iconDeleteThumb, (item) => {
      item.addEventListener('click', async (e) => {
        e.preventDefault()

        const { articleId, id } = item.dataset
        const thumbnail = document.getElementById(`thumbnail-${id}`)
        const { status } = await axios.delete(`/api/articles/${articleId}/thumbnails/${id}`)

        if (status === 204) {
          thumbnail.remove()
        }
      })
    })
  }

  module.init = () => {
    module.showModal()
    module.confirm()
    module.initSelect2()
    module.setCategory()
    module.initCKeditor()
    module.initFileInput()
    module.deleteThumbnail()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const articles = new Articles()
  articles.init()
})
