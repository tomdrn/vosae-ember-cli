`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'adapter:timeline-entry', 'TimelineEntryAdapter', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

# Replace this with your real tests.
test 'it exists', (assert) ->
  adapter = @subject()
  assert.ok adapter

test 'method - pathForType', (assert) ->
  expect(2)
  adapter = @subject()
  assert.equal adapter.pathForType(), "timeline", "without type pathForType should always returns 'timeline'"
  assert.equal adapter.pathForType("contactSavedTimelineEntry"), "timeline", "even with a given type pathForType should always return 'timeline'"
