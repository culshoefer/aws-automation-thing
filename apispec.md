# PREAMBLE
The following is a rough REST API specification for this project.
To any future employers (or otherwise people who I would be concerned about a high-quality API): THIS IS NOT HOW I WOULD DEVELOP AN API IN REAL LIFE. There are terrible implications if you specify an API this way. By all means, the following is no example of a perfect specification. However, for this week-long project with the main focus being on learning CI/AWS command line tools etc. and not the application itself, this should suffice.

The REST API for this shall be located at `/references/`.


For creating a new reference, one shall perform a `PUT` request at `/references/`. The `PUT` and `POST` shall be a JSON of the following format:
```json
{
	"title": "titleofnewreference",
	"link": "link://to.some.resource/if/not/specified/use/empty/string",
	"notes": "Some freeform string with a maximum length of 3000 characters"
}
```

The response to each shall be the ID of the generated reference:
```json
{
	"refid": "k;2l3mf12klf12nlk21j;21lkje;lkjDKJLFM#KL:QM"
}
```

The `GET` response is of the following form: 
```json
{
	"error": null|"Error description",
	"data": [
		{
			"title": "titleofnewreference",
			"link": "link://to.some.resource/if/not/specified/use/empty/string",
			"notes": "Some freeform string with a maximum length of 3000 characters",
			"refid": "alsfm;lk1n12l;2ml2m"
		},
		{
			"title": "titleofnewreference",
			"link": "link://to.some.resource/if/not/specified/use/empty/string",
			"notes": "Some freeform string with a maximum length of 3000 characters",
			"refid": "alsfm;lk1n12l;2ml2m"
		}
	]
}
```

For `DELETE`, just specify the ids you want to delete:
```json
{
	"refids": [
		"alse;mfeslamksease",
		"lkm2lknl21hj321l"
	]
}
```
The response to `DELETE` is empty, we will just delete what exists and if the reference ID does not exist, we will ignore the id.
