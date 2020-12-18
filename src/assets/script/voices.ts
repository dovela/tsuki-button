import { CategoryItem, VoicesItem } from './option'

const jsonList = require.context('@/../setting/translate', false, /.json$/).keys().map(item => {
  return item.substring(2)
})

let Locales
let CategoryList: CategoryItem[]
let VoicesList: VoicesItem[]
jsonList.forEach(name => {
  if (name === 'locales.json') {
    Locales = require(`@/../setting/translate/${name}`)
  } else if (name === 'category.json') {
    CategoryList = require(`@/../setting/translate/${name}`)
  } else {
    const voice = require(`@/../setting/translate/${name}`)
    VoicesList = [...voice]
  }
})

export {
  Locales,
  CategoryList,
  VoicesList
}
