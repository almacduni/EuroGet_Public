"""new

Revision ID: 4bc258fb6d17
Revises: 
Create Date: 2024-01-10 23:22:56.855439

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision = '4bc258fb6d17'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('bank_ibans',
    sa.Column('account_created', sa.DateTime(timezone=True), nullable=True),
    sa.Column('id', sa.UUID(), nullable=False),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('institution_id', sa.Text(), nullable=True),
    sa.Column('connection_status', sa.Text(), nullable=True),
    sa.Column('bank_logo', sa.Text(), nullable=True),
    sa.Column('bank_name', sa.Text(), nullable=True),
    sa.Column('iban', sa.Text(), nullable=True),
    sa.Column('requisition_id', sa.Text(), nullable=True),
    sa.Column('owner_name', sa.Text(), nullable=True),
    sa.Column('account_id', sa.Text(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_bank_ibans_id'), 'bank_ibans', ['id'], unique=False)
    op.create_index(op.f('ix_bank_ibans_user_id'), 'bank_ibans', ['user_id'], unique=False)
    op.create_table('tokens',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('gc_ob_access_token', sa.Text(), nullable=True),
    sa.Column('gc_ob_refresh_token', sa.Text(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_tokens_id'), 'tokens', ['id'], unique=False)
    op.create_table('users',
    sa.Column('id', sa.UUID(), nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('email', sa.Text(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_users_id'), 'users', ['id'], unique=False)
    op.create_table('account_info',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('email', sa.Text(), nullable=True),
    sa.Column('first_name', sa.Text(), nullable=True),
    sa.Column('last_name', sa.Text(), nullable=True),
    sa.Column('birth_date', sa.Date(), nullable=True),
    sa.Column('tax_id', sa.Text(), nullable=True),
    sa.Column('country_code', sa.Text(), nullable=True),
    sa.Column('address', sa.Text(), nullable=True),
    sa.Column('city', sa.Text(), nullable=True),
    sa.Column('zip_code', sa.Text(), nullable=True),
    sa.Column('country', sa.Text(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_account_info_id'), 'account_info', ['id'], unique=False)
    op.create_index(op.f('ix_account_info_user_id'), 'account_info', ['user_id'], unique=False)
    op.create_table('feedback',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('message', sa.Text(), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('email', sa.Text(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_feedback_id'), 'feedback', ['id'], unique=False)
    op.create_index(op.f('ix_feedback_user_id'), 'feedback', ['user_id'], unique=False)
    op.create_table('gc_bank_connects',
    sa.Column('id', sa.UUID(), nullable=False),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('link', sa.Text(), nullable=True),
    sa.Column('requisition_id', sa.Text(), nullable=True),
    sa.Column('agreement_id', sa.Text(), nullable=True),
    sa.Column('institution_id', sa.Text(), nullable=True),
    sa.Column('max_historical_days', sa.BigInteger(), nullable=True),
    sa.Column('access_valid_for_days', sa.BigInteger(), nullable=True),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('accepted', sa.DateTime(timezone=True), nullable=True),
    sa.Column('bank_accounts', sa.Text(), nullable=True),
    sa.Column('connection_status', sa.Text(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_gc_bank_connects_id'), 'gc_bank_connects', ['id'], unique=False)
    op.create_index(op.f('ix_gc_bank_connects_user_id'), 'gc_bank_connects', ['user_id'], unique=False)
    op.create_table('gc_payment_users',
    sa.Column('id', sa.UUID(), nullable=False),
    sa.Column('p_customer_id', sa.Text(), nullable=False),
    sa.Column('p_bank_account_id', sa.Text(), nullable=True),
    sa.Column('p_mandate_id', sa.Text(), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('iban', sa.Text(), nullable=True),
    sa.Column('mandate_status', sa.Text(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_gc_payment_users_id'), 'gc_payment_users', ['id'], unique=False)
    op.create_index(op.f('ix_gc_payment_users_user_id'), 'gc_payment_users', ['user_id'], unique=False)
    op.create_table('installment_payments',
    sa.Column('id', sa.BigInteger(), autoincrement=True, nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('payment_amount', sa.BigInteger(), nullable=True),
    sa.Column('instalment_id', sa.Text(), nullable=True),
    sa.Column('is_part_of_instalment', sa.Boolean(), nullable=True),
    sa.Column('status', sa.Text(), nullable=True),
    sa.Column('charge_date', sa.DateTime(timezone=True), nullable=True),
    sa.Column('payment_id', sa.Text(), nullable=True),
    sa.Column('subscription_id', sa.Text(), nullable=True),
    sa.Column('is_part_of_subscription', sa.Boolean(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ondelete='SET NULL'),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('payment_id')
    )
    op.create_index(op.f('ix_installment_payments_id'), 'installment_payments', ['id'], unique=False)
    op.create_table('issued_loans',
    sa.Column('loan_id', sa.UUID(), nullable=False),
    sa.Column('user_id', sa.UUID(), nullable=False),
    sa.Column('sum', sa.Float(), nullable=False),
    sa.Column('date', sa.DateTime(timezone=True), nullable=True),
    sa.Column('is_paid', sa.Boolean(), nullable=False),
    sa.Column('instalment_id', sa.Text(), nullable=True),
    sa.Column('commission', sa.Numeric(), nullable=False),
    sa.Column('total_sum', sa.Numeric(), nullable=False),
    sa.Column('payment_id', sa.Text(), nullable=True),
    sa.Column('payment_status', sa.Text(), nullable=True),
    sa.Column('type', sa.Enum('INSTALLMENT', 'PAYDAY_LOAN', name='loantype'), nullable=False),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ondelete='RESTRICT'),
    sa.PrimaryKeyConstraint('loan_id')
    )
    op.create_index(op.f('ix_issued_loans_loan_id'), 'issued_loans', ['loan_id'], unique=False)
    op.create_table('kyc_data',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('sumsub_id', sa.Text(), nullable=False),
    sa.Column('link', sa.Text(), nullable=True),
    sa.Column('status', sa.Enum('applicantReviewed', 'applicantPending', 'applicantCreated', 'applicantOnHold', 'applicantPersonalInfoChanged', 'applicantPrechecked', 'applicantDeleted', 'applicantLevelChanged', 'videoIdentStatusChanged', 'applicantReset', 'applicantActionPending', 'applicantActionReviewed', 'applicantActionOnHold', 'applicantWorkflowCompleted', name='kycstatus'), nullable=True),
    sa.Column('reject_labels', postgresql.JSONB(astext_type=sa.Text()), nullable=True),
    sa.Column('review_answer', sa.Enum('RED', 'GREEN', name='reviewanswer'), nullable=True),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_kyc_data_id'), 'kyc_data', ['id'], unique=False)
    op.create_index(op.f('ix_kyc_data_user_id'), 'kyc_data', ['user_id'], unique=True)
    op.create_table('ml_ob_dataset',
    sa.Column('id', sa.UUID(), nullable=False),
    sa.Column('raw_transactions', sa.JSON(), nullable=True),
    sa.Column('gc_account_id', sa.Text(), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('agreement_id', sa.Text(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_ml_ob_dataset_id'), 'ml_ob_dataset', ['id'], unique=False)
    op.create_index(op.f('ix_ml_ob_dataset_user_id'), 'ml_ob_dataset', ['user_id'], unique=False)
    op.create_table('nps_scores',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('nps', sa.BigInteger(), nullable=True),
    sa.Column('message', sa.Text(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_nps_scores_id'), 'nps_scores', ['id'], unique=False)
    op.create_index(op.f('ix_nps_scores_user_id'), 'nps_scores', ['user_id'], unique=False)
    op.create_table('payday_loan_installment_payments',
    sa.Column('id', sa.BigInteger(), autoincrement=True, nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('amount', sa.BigInteger(), nullable=True),
    sa.Column('instalment_ids', sa.Text(), nullable=True),
    sa.Column('status', sa.Text(), nullable=True),
    sa.Column('payment_id', sa.Text(), nullable=True),
    sa.Column('charge_date', sa.DateTime(timezone=True), nullable=True),
    sa.Column('loan_payment_ids', sa.Text(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ondelete='SET NULL'),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_payday_loan_installment_payments_id'), 'payday_loan_installment_payments', ['id'], unique=False)
    op.create_table('overdraft_protection',
    sa.Column('id', sa.BigInteger(), autoincrement=True, nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('balance_limit', sa.Float(), nullable=True),
    sa.Column('opt_in_status', sa.Boolean(), nullable=True),
    sa.Column('desired_sum', sa.Float(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('user_id')
    )
    op.create_index(op.f('ix_overdraft_protection_id'), 'overdraft_protection', ['id'], unique=False)
    op.create_table('support_tickets',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('inquiry', sa.Text(), nullable=True),
    sa.Column('email', sa.Text(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_support_tickets_id'), 'support_tickets', ['id'], unique=False)
    op.create_index(op.f('ix_support_tickets_user_id'), 'support_tickets', ['user_id'], unique=False)
    op.create_table('user_loan_management',
    sa.Column('id', sa.BigInteger(), nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('user_id', sa.UUID(), nullable=True),
    sa.Column('total_loan_taken', sa.Float(), nullable=True),
    sa.Column('total_loan_repaid', sa.Float(), nullable=True),
    sa.Column('active_loan', sa.Float(), nullable=True),
    sa.Column('approved', sa.Boolean(), nullable=True),
    sa.Column('initial_credit_decision', sa.Text(), nullable=True),
    sa.Column('payments_in_the_row', sa.BigInteger(), nullable=True),
    sa.Column('missed_payments', sa.BigInteger(), nullable=True),
    sa.Column('current_limit', sa.BigInteger(), nullable=True),
    sa.Column('active_loan_count', sa.SmallInteger(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_user_loan_management_id'), 'user_loan_management', ['id'], unique=False)
    op.create_index(op.f('ix_user_loan_management_user_id'), 'user_loan_management', ['user_id'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_user_loan_management_user_id'), table_name='user_loan_management')
    op.drop_index(op.f('ix_user_loan_management_id'), table_name='user_loan_management')
    op.drop_table('user_loan_management')
    op.drop_index(op.f('ix_support_tickets_user_id'), table_name='support_tickets')
    op.drop_index(op.f('ix_support_tickets_id'), table_name='support_tickets')
    op.drop_table('support_tickets')
    op.drop_index(op.f('ix_overdraft_protection_id'), table_name='overdraft_protection')
    op.drop_table('overdraft_protection')
    op.drop_index(op.f('ix_payday_loan_installment_payments_id'), table_name='payday_loan_installment_payments')
    op.drop_table('payday_loan_installment_payments')
    op.drop_index(op.f('ix_nps_scores_user_id'), table_name='nps_scores')
    op.drop_index(op.f('ix_nps_scores_id'), table_name='nps_scores')
    op.drop_table('nps_scores')
    op.drop_index(op.f('ix_ml_ob_dataset_user_id'), table_name='ml_ob_dataset')
    op.drop_index(op.f('ix_ml_ob_dataset_id'), table_name='ml_ob_dataset')
    op.drop_table('ml_ob_dataset')
    op.drop_index(op.f('ix_kyc_data_user_id'), table_name='kyc_data')
    op.drop_index(op.f('ix_kyc_data_id'), table_name='kyc_data')
    op.drop_table('kyc_data')
    op.drop_index(op.f('ix_issued_loans_loan_id'), table_name='issued_loans')
    op.drop_table('issued_loans')
    op.drop_index(op.f('ix_installment_payments_id'), table_name='installment_payments')
    op.drop_table('installment_payments')
    op.drop_index(op.f('ix_gc_payment_users_user_id'), table_name='gc_payment_users')
    op.drop_index(op.f('ix_gc_payment_users_id'), table_name='gc_payment_users')
    op.drop_table('gc_payment_users')
    op.drop_index(op.f('ix_gc_bank_connects_user_id'), table_name='gc_bank_connects')
    op.drop_index(op.f('ix_gc_bank_connects_id'), table_name='gc_bank_connects')
    op.drop_table('gc_bank_connects')
    op.drop_index(op.f('ix_feedback_user_id'), table_name='feedback')
    op.drop_index(op.f('ix_feedback_id'), table_name='feedback')
    op.drop_table('feedback')
    op.drop_index(op.f('ix_account_info_user_id'), table_name='account_info')
    op.drop_index(op.f('ix_account_info_id'), table_name='account_info')
    op.drop_table('account_info')
    op.drop_index(op.f('ix_users_id'), table_name='users')
    op.drop_table('users')
    op.drop_index(op.f('ix_tokens_id'), table_name='tokens')
    op.drop_table('tokens')
    op.drop_index(op.f('ix_bank_ibans_user_id'), table_name='bank_ibans')
    op.drop_index(op.f('ix_bank_ibans_id'), table_name='bank_ibans')
    op.drop_table('bank_ibans')
    # ### end Alembic commands ###
