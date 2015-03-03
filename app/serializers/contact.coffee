`import DS from 'ember-data'`
`import ApplicationSerializer from './application'`

ContactSerializer = ApplicationSerializer.extend
  attrs:
    emails: {embedded: 'always'}
    phones: {embedded: 'always'}
    addresses: {embedded: 'always'}

`export default ContactSerializer`
