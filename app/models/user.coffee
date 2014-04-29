User = DS.Model.extend
  link: DS.belongsTo 'link'
  email: DS.attr 'string'
  password: DS.attr 'string'

`export default User`
