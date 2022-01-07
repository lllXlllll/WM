#########################################
#                                       #
#        WM Package - Initializer       #
#                                       #
#########################################

#INCLUDE
include('lib/libsys.ms')
include('lib/libwc.ms')
include('dev/libwcd.ms')

#Messages Parser
proc _PM(@message, @array = '') {
    @msg = import('wm.messages.kr')[@message]
	if(is_array(@array)) {
		foreach(@key:@value in @array) {
			@msg = replace(@msg, '{'.@key.'}', @value)
		}
	}
	return(colorize(@msg))
}