`import ApplicationAdapter from 'vosae/adapters/application'`

###
  Custom adapter for model `TimelineEntry` and all submodels.
  @class TimelineEntryAdapter
  @extends ApplicationAdapter
###

TimelineEntryAdapter = ApplicationAdapter.extend
  ###
   * This method return the good pathname. Regardless of the given
   * type `ContactSavedTimelineEntry` or `OrganizationSavedTimelineEntry`,
   * the pathname must always be the same: '/timeline/'.
   * @param  {DS.Model} type
   * @return {String}
  ###
  pathForType: (type) -> "timeline"

`export default TimelineEntryAdapter`
