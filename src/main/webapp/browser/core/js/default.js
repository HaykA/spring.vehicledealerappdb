/**
 * 
 */
$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip()
});

$(function () {
  $('[data-toggle="popover"]').popover();
})


$(document).ready(function() {
    $("select").each(function () {
        $(this).val($(this).find('option[selected]').val());
    });
});

$(document).ready(function() {
	$disableOSButton = $('button[role="disableOnSubmit"');
	disableOnSubmit($disableOSButton);
});

$(document).ready(function() {
	$hidableSlave = $('*[role="hidableSlave"]');
	$hidableSlaveInput = $('input[role="hidableSlave"]');
	$disablingSlave = $('*[role="disablingSlave"]');
	$hidableSlave.hide();
	
	$('*[role="masterForHidableSlaves"]').bind('change input', function() {
		showHidableSlave();
		$disablingSlave.attr('disabled', 'disabled');
		$disablingSlave.click(function(e) {
			e.preventDefault();
		});
	});
	
	function showHidableSlave() {
		if ($hidableSlave.is(':hidden')) {
			$hidableSlave.fadeIn(200);
		}
	}
});

function changeValue(masterId, slaveId) {
	$master = $('#' + masterId);
	$slave = $('#' + slaveId);
	$master.change(function() {
		$slave.val($master.val());
	});
}

/**
 * Disables button on submit, by control-id
 * @param id is the button-id which must be disabled on submit
 */
function disableOnSubmit($button) {
	$('form').on('submit', function(e) {
		$button.prop('disabled', 'disabled');
		$icon = $button.find('i');
		if ($icon !== null) {
			$icon.removeClass();
			$icon.addClass('fa');
			$icon.addClass('fa-spinner');
			$icon.addClass('fa-spin');
		}
	});
}

/**
 * Disables button on submit, by control-id
 * @param id is the button-id which must be disabled on submit
 */
function disableOnSubmitById(id) {
	disableOnSubmit($('#' + id));
}

function checkSelectAllByName($master, $slave, selectAllText, unselectAllText, showIcon) {
	// var $master = $('#' + masterId);
	// var $slave = $('input:checkbox[name=' + slaveName + ']');
	var btnPrimary = 'btn-primary';
	var btnDefault = 'btn-default';
	
	if (showIcon) {
		selectAllText = '<i class="fa fa-square-o fa-fw"></i> ' + selectAllText;
		unselectAllText = '<i class="fa fa-check-square fa-fw"></i> ' + unselectAllText;
	}
	
	if ($slave.length > 0 && $slave.not(':checked').length == 0) {
		$master.removeClass(btnDefault);
		$master.addClass(btnPrimary);
		$master.html(unselectAllText);
		$master.prop('role', 'unselector');
	} else {
		$master.removeClass(btnPrimary);
		$master.addClass(btnDefault);
		$master.html(selectAllText);
		$master.prop('role', 'selector');
		if ($slave.length == 0) {
			$master.prop('disabled', 'disabled');
		}
	}
}

function handleSlaveSelectAll($master, $slave, selectAllText, unselectAllText, showIcon) {
	checkSelectAllByName($master, $slave, selectAllText, unselectAllText, showIcon);
	$slave.change(function() {
		checkSelectAllByName($master, $slave, selectAllText, unselectAllText, showIcon);
	});
}

function handleMasterSelectAll($master, $slave) {
	$master.click(function() {
		if ($master.prop('role') == 'selector') {
			$slave.prop('checked', true);
		} else {
			$slave.prop('checked', false);
		}
		$slave.trigger('change');
	});
}

function handleSelectAllFunction(masterId, slaveName, selectAllText, unselectAllText, showIcon, onLoad) {
	var $master = $('#' + masterId);
	var $slave = $('input:checkbox[name=' + slaveName + ']');
	handleSlaveSelectAll($master, $slave, selectAllText, unselectAllText, showIcon);
	
	if (onLoad) {
		$(document).ready(function () {
			$slave.trigger('change');
		});
	}
	
	handleMasterSelectAll($master, $slave);
}

function handleSelectAllFunctionForSlaveContainingName(masterId, slaveNameFragment, selectAllText, unselectAllText, showIcon, onLoad) {
	var $master = $('#' + masterId);
	var $slave = $('input:checkbox[name*=' + slaveNameFragment + ']');
	handleSlaveSelectAll($master, $slave, selectAllText, unselectAllText, showIcon);
	
	if (onLoad) {
		$(document).ready(function () {
			$slave.trigger('change');
		});
	}
	
	handleMasterSelectAll($master, $slave);
}

function handleControlEnabled(controlId, slaveName, onLoad) {
	var $control = $('#' + controlId);
	var $slave = $('input:checkbox[name=' + slaveName + ']');
	
	if (onLoad) {
		$(document).ready(function () {
			$slave.trigger('change');
		});
	}
	
	$slave.change(function() {
		handleControl($control, $slave);
	});
}

function handleControl($control, $slave) {
	if ($slave.filter(':checked').length > 0) {
		$control.removeProp('disabled');
	} else {
		$control.prop('disabled', 'disabled');
	}
}

function loadForCities() {
	
}
