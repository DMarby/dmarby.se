export default (date) => {
  let d = new Date(date)
  return `${d.toLocaleDateString('default', { day: 'numeric', year: 'numeric', month: 'long' })}`
}
