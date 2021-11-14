import $ from 'jquery'
import axios from 'axios'
import 'select2'
import 'select2/dist/css/select2.css'
import 'select2-bootstrap-theme/dist/select2-bootstrap.min.css'

function Articles() {
  const module = this

  module.selectCategory = $('#article_category_id')
  module.selectSubCategory =  $('#article_sub_category_id')
  module.selectAuthor = $('#article_author_id')

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
    module.initSelect2()
    module.setCategory()
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const articles = new Articles()
  articles.init()
})
