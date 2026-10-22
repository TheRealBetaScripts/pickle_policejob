# pickle_policejob

Updates we made:
Fixed the shell-casing rate limiter’s timing tolerance and removed its misleading bullet timeout spam.
Prevented shot detection while using the evidence camera.
Built photo capture directly into the police resource.
Removed its screenshot-basic dependency.
Added direct Fivemanage uploads using temporary URLs; the API key stays server-side.
Added timeout, duplicate-request, and failure handling.
Confirmed capture and upload worked in-game in 807 ms.
Removed the temporary debugging logs.
