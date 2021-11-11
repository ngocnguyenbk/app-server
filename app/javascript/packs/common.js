import '@simonwep/pickr/dist/themes/nano.min.css'
import 'bootstrap'
import 'bootstrap-icons/font/bootstrap-icons.scss'
import Litepicker from 'litepicker'
import Pickr from '@simonwep/pickr'
import '@/stylesheets/application'

const images = require.context('@/images', true)

window.images = images
window.Litepicker = Litepicker
window.Pickr = Pickr
