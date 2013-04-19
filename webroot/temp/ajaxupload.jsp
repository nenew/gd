<!DOCTYPE HTML>
<html>
<head>
<title>HTML5 AJAX Uploader</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<style>
.progress {
	width: 0%;
	overflow: hidden;
	height: 40px;
	display: inline-block;
	vertical-align: middle;
	color: #FFF;
	text-align: right;
	text-shadow: 1px 1px 0 #000;
	background: -o-linear-gradient(top, #888888, #333333);
	background: -moz-linear-gradient(top, #888888, #333333);
	background: -webkit-gradient(linear, left top, left bottom, from(#888888),
		to(#333333) );
	background: -webkit-linear-gradient(top, #888888, #333333);
	-o-transition-property: width;
	-o-transition-duration: .5s;
	-moz-transition-property: width;
	-moz-transition-duration: .5s;
	-webkit-transition-property: width;
	-webkit-transition-duration: .5s;
}
</style>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript">
	function uploader(input, options) {
		var $this = this;

		// Default settings (mostly debug functions)
		this.settings = {
			prefix : 'file',
			multiple : false,
			autoUpload : false,
			url : "http://127.0.0.1/bootstrap/upload",
			onprogress : function(ev) {
				console.log('onprogress');
				console.log(ev);
			},
			error : function(msg) {
				console.log('error');
				console.log(msg);
			},
			success : function(data) {
				console.log('success');
				console.log(data);
			}
		};
		$.extend(this.settings, options);

		this.input = input;
		this.xhr = new XMLHttpRequest();

		this.send = function() {
			// Make sure there is at least one file selected
			if ($this.input.files.length < 1) {
				if ($this.settings.error)
					$this.settings.error('Must select a file to upload');
				return false;
			}
			// Don't allow multiple file uploads if not specified
			if ($this.settings.multi === false && $this.input.files.length > 1) {
				if ($this.settings.error)
					$this.settings.error('Can only upload one file at a time');
				return false;
			}
			// Must determine whether to send one or all of the selected files
			if ($this.settings.multi) {
				$this.multiSend($this.input.files);
			} else {
				$this.singleSend($this.input.files[0]);
			}
		};

		// Prep a single file for upload
		this.singleSend = function(file) {
			var data = new FormData();
			data.append(String($this.settings.prefix), file);
			$this.upload(data);
		};

		// Prepare all of the input files for upload
		this.multiSend = function(files) {
			var data = new FormData();
			for ( var i = 0; i < files.length; i++)
				data
						.append(String($this.settings.prefix) + String(i),
								files[i]);
			$this.upload(data);
		};

		// The actual upload calls
		this.upload = function(data) {
			$this.xhr.open('POST', '/bootstrap/upload', true);
			$this.xhr.send(data);
		};

		// Modify options after instantiation
		this.setOpt = function(opt, val) {
			$this.settings[opt] = val;
			return $this;
		};
		this.getOpt = function(opt) {
			return $this.settings[opt];
		};

		// Set the input element after instantiation
		this.setInput = function(elem) {
			$this.input = elem;
			return $this;
		};
		this.getInput = function() {
			return $this.input;
		};

		// Basic setup for the XHR stuff
		if (this.settings.progress)
			this.xhr.upload.addEventListener('progress',
					this.settings.progress, false);
		this.xhr.onreadystatechange = function(ev) {
			if ($this.xhr.readyState == 4) {
				console.log('done!');
				if ($this.xhr.status == 200) {
					if ($this.settings.success)
						$this.settings.success($this.xhr.responseText, ev);
					$this.input.value = '';
				} else {
					if ($this.settings.error)
						$this.settings.error(ev);
				}
			}
		};

		// onChange event for autoUploads
		if (this.settings.autoUpload)
			this.input.onchange = this.send;
	}
</script>
<script type="text/javascript">
	$(function() {
		var $b = $('#upload'), $f = $('#file'), $p = $('#progress'), up = new uploader(
				$f.get(0), {
					url : '/',
					progress : function(ev) {
						console.log('progress');
						$p.html(((ev.loaded / ev.total) * 100) + '%');
						$p.css('width', $p.html());
					},
					error : function(ev) {
						console.log('error');
					},
					success : function(data) {
						console.log('success');
						$p.html('100%');
						$p.css('width', $p.html());
					}
				});

		$b.click(function() {
			up.send();
		});
	});
</script>
</head>
<body>
	<p>
		<label for="file">Choose file</label> <input type="file" id="file"
			name="file" accept="image/jpg, image/jpeg, image/gif, image/png" />
	</p>
	<p>
		<button id="upload">Upload</button>
	</p>
	<p>
		<span id="progress" class="progress">0%</span>
	</p>
</body>