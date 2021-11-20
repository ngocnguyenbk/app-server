import '@simonwep/pickr/dist/themes/nano.min.css'
import 'bootstrap'
import 'bootstrap-icons/font/bootstrap-icons.scss'
import '@/stylesheets/application'

import '@/libs/back-to-top'

const images = require.context('@/images', true)

window.images = images
