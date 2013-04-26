FLG.Models.User = Backbone.RelationalModel.extend({
	relations: [{
		type: Backbone.HasMany,
		key: 'receivedMessages',
		relatedModel: 'FLG.Models.ReceivedMessage',
		collectionType: 'FLG.Collections.ReceivedMessages',
		reverseRelation: {
			key: 'user',
			keySource: 'user_id',
			includeInJSON: 'id'
			// 'relatedModel' is automatically set to 'Zoo'; the 'relationType' to 'HasOne'.
		}
	}]
});