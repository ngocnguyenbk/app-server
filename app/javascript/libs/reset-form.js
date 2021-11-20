import { forEach } from 'lodash'

const resetForm = (form) => {
  forEach(form.elements, (element) => {
    switch (element.type) {
      case 'text':
      case 'textarea':
      case 'hidden':
        element.value = ''
        break
      case 'checkbox':
      case 'radio':
        element.checked = false
        break
      default:
        break
    }
  })
}
export default resetForm
