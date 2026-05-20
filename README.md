# Cleans up zoom transcripts locally
# Removes extra lines like:
#
# 9
# 00:00:52.337 --> 00:00:55.539
#
# Groups lines like:
# 
# Speaker1: Hello.
# Speaker1: Welcome to the meeting.
# Speaker1: Thank you all for joining.
# Speaker2: Good afternoon speaker1.
# 
# Output looks like:
# 
# Speaker1: Hello.
#  Welcome to the meeting.
#  Thank you all for joining.
# Speaker2: Good afternoon speaker1.
# 
# USAGE: ./clean_zoom_transcript transcript.txt > clean_file.txt
