export default date => {
  let d = new Date(date)
  return `${d.toISOString()}`
}
