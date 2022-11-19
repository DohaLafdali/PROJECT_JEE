package MDP;


import java.util.List;

public interface CompteIdao extends IDAO<Utilisateur> {
    public List<Utilisateur> getAll(String des);
}
