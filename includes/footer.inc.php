 <div class="footer">
	<div>
		&nbsp;
		<span class="pull-right">
			<strong>Copyright</strong> VDEV 2017
		</span>
		
	</div>
</div>

</div>
		



    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-2.1.1.js"></script>
    <script src="/includes/js/bootstrap.min.js"></script>
    <script src="/includes/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/includes/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="/includes/js/plugins/dataTables/datatables.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="/includes/js/inspinia.js"></script>
    <script src="/includes/js/plugins/pace/pace.min.js"></script>
	<script src="/includes/js/custom/app.js"></script>
	
	
	    <script>
        $(document).ready(function(){
            $('.dataTables-example').DataTable({
                pageLength: 10,
				 ordering:  false,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    { extend: 'copy'},
                    {extend: 'csv'}
                ]

            });

        });
    </script>
</body>

</html>
