namespace VTYSOdev
{
    partial class OgrenciEkran
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.data_tum_dersler = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.data_aldigim_dersler = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txt_ders_al_no = new System.Windows.Forms.TextBox();
            this.btn_ders_al = new System.Windows.Forms.Button();
            this.btn_ders_birak = new System.Windows.Forms.Button();
            this.txt_ders_birak_no = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.data_tum_dersler)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.data_aldigim_dersler)).BeginInit();
            this.SuspendLayout();
            // 
            // data_tum_dersler
            // 
            this.data_tum_dersler.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.data_tum_dersler.Location = new System.Drawing.Point(12, 35);
            this.data_tum_dersler.Name = "data_tum_dersler";
            this.data_tum_dersler.Size = new System.Drawing.Size(395, 277);
            this.data_tum_dersler.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(64, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Tüm Dersler";
            // 
            // data_aldigim_dersler
            // 
            this.data_aldigim_dersler.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.data_aldigim_dersler.Location = new System.Drawing.Point(413, 35);
            this.data_aldigim_dersler.Name = "data_aldigim_dersler";
            this.data_aldigim_dersler.Size = new System.Drawing.Size(395, 277);
            this.data_aldigim_dersler.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(410, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(76, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Aldığım Dersler";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(14, 331);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(96, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Alınacak Ders No :";
            // 
            // txt_ders_al_no
            // 
            this.txt_ders_al_no.Location = new System.Drawing.Point(116, 328);
            this.txt_ders_al_no.Name = "txt_ders_al_no";
            this.txt_ders_al_no.Size = new System.Drawing.Size(182, 20);
            this.txt_ders_al_no.TabIndex = 5;
            // 
            // btn_ders_al
            // 
            this.btn_ders_al.Location = new System.Drawing.Point(304, 318);
            this.btn_ders_al.Name = "btn_ders_al";
            this.btn_ders_al.Size = new System.Drawing.Size(103, 38);
            this.btn_ders_al.TabIndex = 6;
            this.btn_ders_al.Text = "Ders Al";
            this.btn_ders_al.UseVisualStyleBackColor = true;
            this.btn_ders_al.Click += new System.EventHandler(this.Btn_ders_al_Click);
            // 
            // btn_ders_birak
            // 
            this.btn_ders_birak.Location = new System.Drawing.Point(705, 318);
            this.btn_ders_birak.Name = "btn_ders_birak";
            this.btn_ders_birak.Size = new System.Drawing.Size(103, 38);
            this.btn_ders_birak.TabIndex = 9;
            this.btn_ders_birak.Text = "Ders Bırak";
            this.btn_ders_birak.UseVisualStyleBackColor = true;
            this.btn_ders_birak.Click += new System.EventHandler(this.Btn_ders_birak_Click);
            // 
            // txt_ders_birak_no
            // 
            this.txt_ders_birak_no.Location = new System.Drawing.Point(528, 328);
            this.txt_ders_birak_no.Name = "txt_ders_birak_no";
            this.txt_ders_birak_no.Size = new System.Drawing.Size(171, 20);
            this.txt_ders_birak_no.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(415, 331);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(107, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Bırakılacak Ders No :";
            // 
            // OgrenciEkran
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(822, 365);
            this.Controls.Add(this.btn_ders_birak);
            this.Controls.Add(this.txt_ders_birak_no);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btn_ders_al);
            this.Controls.Add(this.txt_ders_al_no);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.data_aldigim_dersler);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.data_tum_dersler);
            this.Name = "OgrenciEkran";
            this.Text = "Öğrenci Bilgi Sistemi";
            this.Load += new System.EventHandler(this.OgrenciEkran_Load);
            ((System.ComponentModel.ISupportInitialize)(this.data_tum_dersler)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.data_aldigim_dersler)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView data_tum_dersler;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView data_aldigim_dersler;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txt_ders_al_no;
        private System.Windows.Forms.Button btn_ders_al;
        private System.Windows.Forms.Button btn_ders_birak;
        private System.Windows.Forms.TextBox txt_ders_birak_no;
        private System.Windows.Forms.Label label4;
    }
}