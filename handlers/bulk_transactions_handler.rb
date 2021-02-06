class BulkTransactionsHandler
  def initialize(data)
    @account = BankAccounts.find_by!(bic: data["organization_bic"])
    @transactions = data["credit_transfers"]
    @validate_service = ValidateTransactionsService.new(@account.balance_cents, @transactions)
    @transfer_service = TransferService.new(@account)
    # @debit_service = DebitService.new(@account)
  end

  def transfer
    raise InsufficientCredits unless @validate_service.can_transfer?

    @transactions.each { |transaction| @transfer_service.transfer(transaction) }

    # @debit_service.debit_credit()
  end
end
