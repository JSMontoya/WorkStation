package Model.DTO;

/**
 * @author David
 * @version 1.0
 */
public class ObjCredito {

    private String documentoUsuario = "";
    private String fechaInicio = "";
    private double saldoInicial = 0;
    private double saldoActual = 0;
    private int idCredito;
    private int estadoCredito;

    public int getIdCredito() {
        return idCredito;
    }

    public void setIdCredito(int idCredito) {
        this.idCredito = idCredito;
    }

    public String getDocumentoUsuario() {
        return documentoUsuario;
    }

    public void setDocumentoUsuario(String documentoUsuario) {
        this.documentoUsuario = documentoUsuario;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public double getSaldoInicial() {
        return saldoInicial;
    }

    public void setSaldoInicial(double saldoInicial) {
        this.saldoInicial = saldoInicial;
    }

    public double getSaldoActual() {
        return saldoActual;
    }

    public void setSaldoActual(double saldoActual) {
        this.saldoActual = saldoActual;
    }

    public int getEstadoCredito() {
        return estadoCredito;
    }

    public void setEstadoCredito(int estadoCredito) {
        this.estadoCredito = estadoCredito;
    }
}    // end ObjCredito


//~ Formatted by Jindent --- http://www.jindent.com
